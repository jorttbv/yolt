# frozen_string_literal: true

module Yolt
  module Resources
    class UserSite
      def initialize(client, id)
        @resource = ProtectedResource.new(client, "site-management/user-sites/#{id}")
      end

      def show(client_user_id:)
        @resource.get(
          headers: {
            'client-user-id' => client_user_id,
          },
        )
      end
    end
  end
end
