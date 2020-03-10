# frozen_string_literal: true

describe Yolt::Resources::UserSite, :configured, :vcr do
  let(:user_site) { Yolt.client.user_site(TEST_USER_SITE_ID) }

  describe '#show' do
    subject(:show_user_site_response) { user_site.show(client_user_id: TEST_CLIENT_USER_ID) }

    it 'returns the user site' do
      expect(show_user_site_response).to eq(
        '_links' => {
          'delete' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
          'getNextStep' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/step'},
          'mfaForm' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/mfa'},
          'migrationGroup' => {'href' => ''},
          'refresh' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/refresh'},
          'renewAccess' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
          'renewConsent' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
          'site' => {'href' => '/site-management/sites/ca8a362a-a351-4358-9f1c-a8b4b91ed65b'},
          'updateCredentials' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
        },
        'action' => nil,
        'externalConsentExpiresAt' => '2020-06-08T15:13:52.060Z',
        'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
        'lastDataFetch' => '2020-03-10T15:13:53+0000',
        'migrationStatus' => 'NONE',
        'noLongerSupported' => false,
        'reason' => nil,
        'site' => nil,
        'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
        'status' => 'REFRESH_FINISHED',
        'statusTimeoutSeconds' => nil,
      )
    end
  end
end
