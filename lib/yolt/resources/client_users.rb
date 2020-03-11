# frozen_string_literal: true

module Yolt
  module Resources
    class ClientUsers
      def initialize(client)
        @resource = ProtectedResource.new(client, 'client-users/client-users')
      end

      def create(country_code:)
        @resource.post(countryCode: country_code)
      end
    end
  end
end
