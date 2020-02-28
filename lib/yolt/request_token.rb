# frozen_string_literal: true

require 'securerandom'

module Yolt
  class RequestToken
    class << self
      def create(client_id, request_token_public_key_id, private_key_path, jti = SecureRandom.uuid)
        `
          step crypto jwt sign --iss #{client_id} \
            --kid #{request_token_public_key_id} \
            --key #{private_key_path} \
            --alg RS512 \
            --jti=#{jti} \
            --subtle
        `.strip
      end
    end
  end
end
