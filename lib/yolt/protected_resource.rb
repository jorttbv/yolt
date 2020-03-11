# frozen_string_literal: true

module Yolt
  class ProtectedResource
    include Resource

    def initialize(configuration, path)
      @configuration = configuration
      @rest_resource = create_rest_resource(configuration, path)
    end

    def post(payload, headers: {})
      retry_upon_access_token_expiry do
        @rest_resource.post(
          JSON.dump(payload),
          default_headers
            .merge(headers),
          &ResponseHandler.method(:handle_response)
        )
      end
    end

    def get(params: {}, headers: {})
      retry_upon_access_token_expiry do
        @rest_resource.get(
          default_headers
            .merge(headers)
            .merge(params: params),
          &ResponseHandler.method(:handle_response)
        )
      end
    end

    def retry_upon_access_token_expiry
      @attempt ||= 1
      yield
    rescue Error::Unauthorized => e
      raise unless e.error_code == ErrorCode::ACCESS_TOKEN_EXPIRED
      raise if @attempt == 3

      @attempt += 1
      @configuration.access_token_cache.clear!
      retry
    end

    private

    def default_headers
      {
        content_type: ContentType::JSON,
        authorization: authorization_header,
      }
    end

    def authorization_header
      "Bearer #{access_token}"
    end

    def access_token
      @configuration.access_token_cache.get do
        create_access_token
      end
    end

    def create_access_token
      access_tokens.create(request_token: request_token)['access_token']
    end

    def access_tokens
      Resources::AccessTokens.new(@configuration)
    end

    def request_token
      RequestToken.create(
        @configuration.client_id,
        @configuration.request_token_public_key_id,
        @configuration.private_key_path,
      )
    end
  end
end
