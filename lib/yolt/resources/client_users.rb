# frozen_string_literal: true

require 'rest-client'

module Yolt
  module Resources
    class ClientUsers < Base
      def create(country_code:)
        post('client-users/client-users', countryCode: country_code)
      end
    end
  end
end
