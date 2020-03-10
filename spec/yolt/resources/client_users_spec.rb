# frozen_string_literal: true

describe Yolt::Resources::ClientUsers, :configured, :vcr do
  let(:client_users) { Yolt.client.client_users }

  describe '#create' do
    subject(:create_client_user_response) { client_users.create(country_code: 'NL') }

    it 'creates a new client user' do
      expect(create_client_user_response).to eq(
        'clientId' => 'db63d6fb-426c-4153-85cd-b7491b3f0a91',
        'countryCode' => 'NL',
        'created' => '2020-03-10T15:11:32.461+0000',
        'id' => TEST_CLIENT_USER_ID,
      )
    end
  end
end
