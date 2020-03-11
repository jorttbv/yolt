# frozen_string_literal: true

module Yolt
  module Resources
    class ProtectedResource < Resource
      def post(payload, headers: {})
        perform_request do
          @resource.post(
            JSON.dump(payload),
            default_headers
              .merge(headers),
            &method(:handle_response)
          )
        end
      end

      def get(params: {}, headers: {})
        perform_request do
          @resource.get(
            default_headers
              .merge(headers)
              .merge(params: params),
            &method(:handle_response)
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
end
