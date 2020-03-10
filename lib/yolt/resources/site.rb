# frozen_string_literal: true

module Yolt
  module Resources
    class Site
      def initialize(client, id)
        @resource = ProtectedResource.new(client, "/site-management/v2/sites/#{id}")
      end

      def show
        @resource.get
      end
    end
  end
end
