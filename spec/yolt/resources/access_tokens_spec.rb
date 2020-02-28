# frozen_string_literal: true

describe Yolt::Resources::AccessTokens, :configured, :vcr do
  let(:access_tokens) { Yolt.client.access_tokens }

  describe '#create' do
    subject(:create_access_token_response) { access_tokens.create(request_token: request_token) }

    let(:request_token) do
      Yolt::RequestToken.create(
        Yolt.configuration.client_id,
        Yolt.configuration.request_token_public_key_id,
        Yolt.configuration.private_key_path,
      )
    end

    it 'creates a new token' do
      expect(create_access_token_response).to have_key('access_token')
      expect(create_access_token_response['expires_in']).to eq(600)
      expect(create_access_token_response['scope']).to eq('')
      expect(create_access_token_response['token_type']).to eq('Bearer')
    end
  end
end
