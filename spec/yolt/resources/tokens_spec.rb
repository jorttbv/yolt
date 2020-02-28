# frozen_string_literal: true

describe Yolt::Resources::Tokens, :configured, :vcr do
  let(:tokens) { Yolt.client.tokens }

  describe '#create' do
    subject(:create_token_response) { tokens.create(request_token) }

    let(:request_token) do
      Yolt::RequestToken.create(
        Yolt.configuration.client_id,
        Yolt.configuration.request_token_public_key_id,
        Yolt.configuration.private_key_path,
      )
    end

    it 'creates a new token' do
      expect(create_token_response).to have_key('access_token')
      expect(create_token_response['expires_in']).to eq(600)
      expect(create_token_response['scope']).to eq('')
      expect(create_token_response['token_type']).to eq('Bearer')
    end
  end
end
