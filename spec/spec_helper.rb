# frozen_string_literal: true

require 'yolt'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  REQUEST_TOKEN_REGEX = /^grant_type=client_credentials&request_token=(.*)/.freeze
  c.filter_sensitive_data('CENSORED_REQUEST_TOKEN') do |interaction|
    match = REQUEST_TOKEN_REGEX.match(interaction.request.body)
    match[1] if match
  end

  c.filter_sensitive_data('CENSORED_ACCESS_TOKEN') do |interaction|
    payload = JSON.parse(interaction.response.body)
    payload['access_token']
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before do
    Yolt.reset_configuration
  end

  config.before :each, :configured do
    Yolt.configure do |yolt_config|
      yolt_config.client_id = 'db63d6fb-426c-4153-85cd-b7491b3f0a91'
      yolt_config.request_token_public_key_id = 'baea5e0a-e60f-4ae9-b31b-d5a580124937'
      yolt_config.tls_certificate = IO.read('tls-certificate.pem')
      yolt_config.tls_private_key = IO.read('tls-private-key.pem')
      yolt_config.private_key_path = 'private-key.pem'
    end
  end
end
