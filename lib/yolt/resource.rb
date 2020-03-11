# frozen_string_literal: true

require 'rest-client'

module Yolt
  module Resource
    def create_rest_resource(client, path)
      RestClient::Resource.new(
        "#{client.configuration.base_url}/#{path}",
        ssl_client_cert: OpenSSL::X509::Certificate.new(client.configuration.tls_certificate),
        ssl_client_key: OpenSSL::PKey::RSA.new(client.configuration.tls_private_key),
        verify_ssl: OpenSSL::SSL::VERIFY_PEER,
      )
    end
  end
end
