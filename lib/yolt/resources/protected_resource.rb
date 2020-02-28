# frozen_string_literal: true

module Yolt
  module Resources
    class ProtectedResource < Resource
      JSON_CONTENT_TYPE = 'application/json'

      def post(payload)
        @resource.post(
          JSON.dump(payload),
          content_type: JSON_CONTENT_TYPE,
          authorization: authorization_header,
        ) do |response, _request, _result|
          case response.code
          when 200, 201
            JSON.parse(response.body)
          end
        end
      end

      def get(params = {})
        @resource.get(
          content_type: JSON_CONTENT_TYPE,
          authorization: authorization_header,
          params: params,
        ) do |response, _request, _result|
          case response.code
          when 200, 201
            JSON.parse(response.body)
          end
        end
      end

      private

      def authorization_header
        "Bearer #{@client.access_token}"
      end
    end
  end
end
