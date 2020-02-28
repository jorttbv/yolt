# frozen_string_literal: true

module Yolt
  module Resources
    class Resource
      JSON_CONTENT_TYPE = 'application/json'

      def initialize(client, path)
        @client = client
        @path = path

        @resource = RestClient::Resource.new(
          "#{client.configuration.base_url}/#{path}",
          ssl_client_cert: OpenSSL::X509::Certificate.new(client.configuration.tls_certificate),
          ssl_client_key: OpenSSL::PKey::RSA.new(client.configuration.tls_private_key),
          verify_ssl: OpenSSL::SSL::VERIFY_PEER,
        )
      end

      protected

      def handle_response(response, _request, _result)
        case response.code
        when 200, 201
          return JSON.parse(response.body) if response.headers[:content_type].include?(JSON_CONTENT_TYPE)

          response.body
        end
      end
    end
  end
end
