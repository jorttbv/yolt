# frozen_string_literal: true

module Yolt
  module Resources
    class ProtectedResource < Resource
      def post(payload, headers: {})
        @resource.post(
          JSON.dump(payload),
          default_headers
            .merge(headers),
          &method(:handle_response)
        )
      end

      def get(params: {}, headers: {})
        @resource.get(
          default_headers
            .merge(headers)
            .merge(params: params),
          &method(:handle_response)
        )
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
