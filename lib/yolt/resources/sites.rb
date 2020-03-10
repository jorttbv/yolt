# frozen_string_literal: true

module Yolt
  module Resources
    class Sites
      def initialize(client)
        @resource = ProtectedResource.new(client, 'site-management/v2/sites')
      end

      def index(redirect_url_id: nil)
        @resource.get(
          params: {}.tap do |params|
            params[:redirectUrlId] = redirect_url_id if redirect_url_id
          end,
        )
      end
    end
  end
end
