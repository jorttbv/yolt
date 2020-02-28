# frozen_string_literal: true

module Yolt
  module Resources
    class PublicResource < Resource
      def post(payload)
        @resource.post(payload) do |response, _request, _result|
          case response.code
          when 200, 201
            JSON.parse(response.body)
          end
        end
      end
    end
  end
end
