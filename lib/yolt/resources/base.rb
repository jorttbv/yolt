# frozen_string_literal: true

module Yolt
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      protected

      def rest_resource
        RestClient::Resource.new(
          client.configuration.base_url,
          ssl_client_cert: OpenSSL::X509::Certificate.new(client.configuration.tls_certificate),
          ssl_client_key: OpenSSL::PKey::RSA.new(client.configuration.tls_private_key),
          verify_ssl: OpenSSL::SSL::VERIFY_PEER,
        )
      end

      def post(path, payload)
        rest_resource[path].post(
          JSON.dump(payload),
          content_type: 'application/json',
          authorization: "Bearer #{client.access_token}",
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
