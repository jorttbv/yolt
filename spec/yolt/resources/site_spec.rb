# frozen_string_literal: true

describe Yolt::Resources::Site, :configured, :vcr do
  let(:site) { Yolt.client.site(site_id) }
  let(:site_id) { 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b' }

  describe '#show' do
    subject(:show_site_response) { site.show }

    it 'returns the site' do
      expect(show_site_response).to eq(
        'availableInCountries' => ['GB'],
        'connectionType' => 'DIRECT_CONNECTION',
        'enabled' => true,
        'groupingBy' => 'Yolt test Open banking',
        'health' => {
          'healthStatus' => 'UP',
          'manualMaintenanceFrom' => nil,
          'manualMaintenanceStatus' => 'NONE',
          'manualMaintenanceTo' => nil,
          'successRatioForCreateOrUpdate' => 'not available',
          'successRatioRefresh' => 'not available',
        },
        'id' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
        'loginType' => 'URL',
        'name' => 'Yolt test Open banking',
        'noLongerSupported' => false,
        'services' => {
          'ais' => {
            'hasFormSteps' => false,
            'hasRedirectSteps' => true,
            'onboarded' => {
              'client' => false,
              'redirectUrlIds' => ['4c85be05-9aa3-4532-9c6a-dd0622c06a72'],
            },
          },
        },
        'supportedAccountTypes' => ['CURRENT_ACCOUNT'],
        'tags' => [],
      )
    end
  end
end
