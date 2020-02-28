# frozen_string_literal: true

describe Yolt::Resources::Sites, :configured, :vcr do
  let(:sites) { Yolt.client.sites }

  describe '#index' do
    subject(:list_sites_response) { sites.index }

    it 'returns all sites' do
      expect(list_sites_response).to eq(
        [
          {
            'availableInCountries' => ['GB'],
            'connectionType' => 'DIRECT_CONNECTION',
            'enabled' => true,
            'groupingBy' => 'Yolt test Open banking',
            'health' =>
             {
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
            'services' =>
             {
               'ais' =>
               {
                 'hasFormSteps' => false,
                 'hasRedirectSteps' => true,
                 'onboarded' =>
                 {
                   'client' => false,
                   'redirectUrlIds' => ['4c85be05-9aa3-4532-9c6a-dd0622c06a72'],
                 },
               },
             },
            'supportedAccountTypes' => ['CURRENT_ACCOUNT'],
            'tags' => [],
          },
        ],
      )
    end

    context 'given a redirect_url_id' do
      subject(:list_sites_response) { sites.index(redirect_url_id: 'ba1e4093-dfe0-4bcf-93f3-8294f64f9658') }

      it 'returns matching sites' do
        expect(list_sites_response).to eq([])
      end
    end
  end
end
