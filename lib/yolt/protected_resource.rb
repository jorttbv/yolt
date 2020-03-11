# frozen_string_literal: true

module Yolt
  class ProtectedResource
    include Resource

    def initialize(client, path)
      @client = client
      @rest_resource = create_rest_resource(client.configuration, path)
    end

    def post(payload, headers: {})
      perform_request do
        @rest_resource.post(
          JSON.dump(payload),
          default_headers
            .merge(headers),
          &ResponseHandler.method(:handle_response)
        )
      end
    end

    def get(params: {}, headers: {})
      perform_request do
        @rest_resource.get(
          default_headers
            .merge(headers)
            .merge(params: params),
          &ResponseHandler.method(:handle_response)
        )
      end
    end

    def perform_request
      @attempt ||= 1
      yield
    rescue Error::Unauthorized => e
      raise unless e.error_code == ErrorCode::ACCESS_TOKEN_EXPIRED
      raise if @attempt == 3

      @attempt += 1
      @client.reset_access_token!
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
      "Bearer #{@client.access_token}"
    end
  end
end
