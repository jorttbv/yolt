# frozen_string_literal: true

module Yolt
  module Resources
    class UserSites
      LOGIN_TYPE_URL = 'URL'

      def initialize(client)
        @resource = ProtectedResource.new(client, 'site-management/user-sites')
        @me_resource = ProtectedResource.new(client, 'site-management/user-sites/me')
      end

      def index(client_user_id:)
        @me_resource.get(
          headers: {
            'client-user-id' => client_user_id,
          },
        )
      end

      def create(client_user_id:, login_type:, redirect_url: nil)
        @resource.post(
          {
            loginType: login_type,
          }.tap do |payload|
            payload['redirectUrl'] = redirect_url if login_type == LOGIN_TYPE_URL
          end,
          headers: {
            'client-user-id' => client_user_id,
          },
        )
      end
    end
  end
end
