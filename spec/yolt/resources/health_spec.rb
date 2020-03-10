# frozen_string_literal: true

describe Yolt::Resources::Health, :configured, :vcr do
  let(:health) { Yolt.client.health }

  describe '#show' do
    subject(:show_health_response) { health.show(client_user_id: TEST_CLIENT_USER_ID) }

    it 'returns the client user health' do
      expect(show_health_response).to eq(
        'accountGroups' => [
          {
            'accounts' => [
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => '13d4e396-2871-44d3-9400-5e743c73c405',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => '6976411d-026e-42b0-b8a9-cb40c1944606',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => 'bb37c8b9-c421-43ec-bd14-4714a2c4dec5',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
            ],
            'freshness' => 'UP_TO_DATE',
            'health' => 'UP_TO_DATE',
            'type' => 'FOREIGN_CURRENCY',
          },
        ],
        'freshness' => 'UP_TO_DATE',
        'health' => 'UP_TO_DATE',
        'migrationStatus' => 'NONE',
        'processingStatusDetail' => nil,
        'userSites' => [
          {
            'accounts' => [
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => '13d4e396-2871-44d3-9400-5e743c73c405',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => '6976411d-026e-42b0-b8a9-cb40c1944606',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
              {
                'freshness' => 'UP_TO_DATE',
                'health' => 'UP_TO_DATE',
                'id' => 'bb37c8b9-c421-43ec-bd14-4714a2c4dec5',
                'lastRefreshed' => '2020-03-10T15:13:53+0000',
                'status' => 'DATASCIENCE_FINISHED',
                'updated' => '2020-03-10T15:13:53+0000',
                'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
              },
            ],
            'action' => nil,
            'freshness' => 'UP_TO_DATE',
            'health' => 'UP_TO_DATE',
            'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
            'migrationStatus' => 'NONE',
            'name' => 'Yolt test Open banking',
            'noLongerSupported' => false,
            'reason' => nil,
            'status' => 'REFRESH_FINISHED',
            'statusTimeoutSeconds' => nil,
          },
        ],
      )
    end
  end
end
