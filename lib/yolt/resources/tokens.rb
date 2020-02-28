# frozen_string_literal: true

require 'rest-client'
require 'json'

module Yolt
  module Resources
    class Tokens < Base
      def create(request_token)
        rest_resource['tokens/tokens'].post(
          grant_type: 'client_credentials',
          request_token: request_token,
        ) do |response, _request, _result|
          case response.code
          when 200, 201
            JSON.parse(response.body)
          end
        end
      end
    end
  end
end
