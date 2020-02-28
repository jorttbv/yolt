# frozen_string_literal: true

require 'rest-client'
require 'json'

module Yolt
  module Resources
    class AccessTokens
      def initialize(client)
        @resource = PublicResource.new(client, 'tokens/tokens')
      end

      def create(grant_type: 'client_credentials', request_token:)
        @resource.post(
          grant_type: grant_type,
          request_token: request_token,
        )
      end
    end
  end
end
