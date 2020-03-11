# frozen_string_literal: true

require 'json'

module Yolt
  module Resources
    class AccessTokens
      def initialize(configuration)
        @resource = PublicResource.new(configuration, 'tokens/tokens')
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
