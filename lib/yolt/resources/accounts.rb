# frozen_string_literal: true

module Yolt
  module Resources
    class Accounts
      def initialize(client)
        @resource = ProtectedResource.new(client, '/accounts/user-accounts/me')
      end

      def index(client_user_id:)
        @resource.get(
          headers: {
            'client-user-id' => client_user_id,
          },
        )
      end
    end
  end
end
