# frozen_string_literal: true

module Yolt
  Configuration = Struct.new(
    :base_url,
    :client_id,
    :request_token_public_key_id,
    :private_key_path,
    :tls_certificate,
    :tls_private_key,
    :tls_private_key_challenge_password,
    :access_token_cache,
    keyword_init: true,
  ) do
    class << self
      def default
        new(
          base_url: 'https://api.sandbox.yolt.io',
          access_token_cache: ThreadSafeAccessTokenCache.new,
        )
      end
    end
  end
end
