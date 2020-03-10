# frozen_string_literal: true

describe Yolt::Resources::UserSite, :configured, :vcr do
  let(:user_site) { Yolt.client.user_site(user_site_id) }
  let(:user_site_id) { 'b48622c7-4a98-48b3-a57e-8aa85fe84f9d' }
  let(:client_user_id) { '94913058-99a1-402d-b5c9-1840ed7a982b' }

  describe '#show' do
    subject(:show_user_site_response) { user_site.show(client_user_id: client_user_id) }

    it 'returns the user site' do
      expect(show_user_site_response).to eq(
        '_links' => {
          'delete' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
          'getNextStep' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/step'},
          'mfaForm' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/mfa'},
          'migrationGroup' => {'href' => ''},
          'refresh' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/refresh'},
          'renewAccess' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
          'renewConsent' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
          'site' => {'href' => '/site-management/sites/ca8a362a-a351-4358-9f1c-a8b4b91ed65b'},
          'updateCredentials' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
        },
        'action' => 'UPDATE_CREDENTIALS',
        'externalConsentExpiresAt' => '2020-06-08T14:18:33.265Z',
        'id' => 'b48622c7-4a98-48b3-a57e-8aa85fe84f9d',
        'lastDataFetch' => nil,
        'migrationStatus' => 'NONE',
        'noLongerSupported' => false,
        'reason' => 'NEW_LOGIN_INFO_NEEDED',
        'site' => nil,
        'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
        'status' => 'LOGIN_FAILED',
        'statusTimeoutSeconds' => nil,
      )
    end
  end
end
