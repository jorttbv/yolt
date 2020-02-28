# frozen_string_literal: true

describe Yolt::Resources::ClientUsers, :configured, :vcr do
  let(:client_users) { Yolt.client.client_users }

  describe '#create' do
    subject(:create_client_user_response) { client_users.create(country_code: 'NL') }

    it 'creates a new client user' do
      expect(create_client_user_response).to eq(
        'clientId' => 'db63d6fb-426c-4153-85cd-b7491b3f0a91',
        'countryCode' => 'NL',
        'created' => '2020-02-28T14:23:21.949+0000',
        'id' => '94913058-99a1-402d-b5c9-1840ed7a982b',
      )
    end
  end
end
