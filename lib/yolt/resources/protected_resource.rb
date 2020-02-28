# frozen_string_literal: true

module Yolt
  module Resources
    class ProtectedResource < Resource
      def post(payload)
        @resource.post(
          JSON.dump(payload),
          default_headers,
          &method(:handle_response)
        )
      end

      def get(params = {})
        @resource.get(
          default_headers.merge(
            params: params,
          ),
          &method(:handle_response)
        )
      end

      private

      def default_headers
        {
          content_type: JSON_CONTENT_TYPE,
          authorization: authorization_header,
        }
      end

      def authorization_header
        "Bearer #{@client.access_token}"
      end
    end
  end
end
