# frozen_string_literal: true

module Yolt
  module Resources
    class ClientUsers
      def initialize(configuration)
        @resource = ProtectedResource.new(configuration, 'client-users/client-users')
      end

      def create(country_code:)
        @resource.post(countryCode: country_code)
      end
    end
  end
end
