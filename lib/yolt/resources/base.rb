# frozen_string_literal: true

module Yolt
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def rest_resource
        RestClient::Resource.new(
          client.configuration.base_url,
          ssl_client_cert: OpenSSL::X509::Certificate.new(client.configuration.tls_certificate),
          ssl_client_key: OpenSSL::PKey::RSA.new(client.configuration.tls_private_key),
          verify_ssl: OpenSSL::SSL::VERIFY_PEER,
        )
      end
    end
  end
end
