# frozen_string_literal: true

module Yolt
  module Resources
    class Site
      def initialize(client, id)
        @site_resource = ProtectedResource.new(client, "/site-management/v2/sites/#{id}")
        @initiation_resource = ProtectedResource.new(client, "/site-management/sites/#{id}/initiate-user-site")
      end

      def initiate_user_site(client_user_id:, redirect_url_id: nil, psu_ip_address: nil)
        @initiation_resource.get(
          headers: {
            'client-user-id' => client_user_id,
          }.tap do |headers|
            headers['redirect-url-id'] = redirect_url_id if redirect_url_id
            headers['PSU-IP-Address'] = psu_ip_address if psu_ip_address
          end,
        )
      end

      def show
        @site_resource.get
      end
    end
  end
end
