# frozen_string_literal: true

module Yolt
  module Resources
    class Health
      def initialize(client)
        @resource = ProtectedResource.new(client, '/health/user-health/me')
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
