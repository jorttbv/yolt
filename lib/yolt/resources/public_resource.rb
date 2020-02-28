# frozen_string_literal: true

module Yolt
  module Resources
    class PublicResource < Resource
      def post(payload)
        @resource.post(payload, &method(:handle_response))
      end
    end
  end
end
