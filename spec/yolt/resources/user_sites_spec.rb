# frozen_string_literal: true

describe Yolt::Resources::UserSites, :configured, :vcr do
  let(:user_sites) { Yolt.client.user_sites }

  describe '#index' do
    subject(:list_user_sites_response) { user_sites.index(client_user_id: TEST_CLIENT_USER_ID) }

    it 'lists all user sites' do
      expect(list_user_sites_response).to eq(
        [
          {
            '_links' => {
              'delete' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
              'getNextStep' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/step'},
              'mfaForm' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/mfa'},
              'migrationGroup' => {'href' => ''},
              'refresh' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/refresh'},
              'renewAccess' =>
                {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
              'renewConsent' =>
                {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
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
          },
        ],
      )
    end
  end

  describe '#create' do
    subject(:create_user_site_response) do
      user_sites.create(client_user_id: TEST_CLIENT_USER_ID, login_type: 'URL', redirect_url: redirect_url)
    end

    let(:redirect_url) do
      'http://localhost:9292/yolt/oauth_callback?code=fcd2c670-046e-47c7-8416-91c40fe38603&id_token=eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJZb2x0YmFuayIsImlhdCI6MTU4Mzg1MzE5MiwiZXhwIjoxNTgzOTM5NTkyLCJzdWIiOiI0MWZhYzNmNi1kZDQ3LTRiOWMtYWZjMi00NzI1ZTkxOThlYWMiLCJhY3IiOiJ1cm46b3BlbmJhbmtpbmc6cHNkMjpjYSIsIm9wZW5iYW5raW5nX2ludGVudF9pZCI6IjQxZmFjM2Y2LWRkNDctNGI5Yy1hZmMyLTQ3MjVlOTE5OGVhYyIsImF1ZCI6IllvbHQiLCJub25jZSI6IjhmZWY3Yzg0LTNhZTUtNDllNC05NTZkLTlkYWQ1ZDYwYWNjMSIsImNfaGFzaCI6IlFrd1Z6bGxiMEVmMzNNeWJqQk5kMUE9PSIsInNfaGFzaCI6IlZpenRIck00Wml3R2dDZFk3VzZBX1E9PSJ9.at6St_xB5x6F_5_xnFYO2UmYX5zZP9EQIoJvpB0-KTAPvRSzrOsmggW-8cGRBgRHIYWXA-I6BZ-AcKWnbYe1Siv930Jw_ICQn-cW5rvwNmiplr0MjFcQs7P3m8ka0sqJFcvm6XglkLvVATnkBQ1krTxNzsnG3PJe1aSgPOq0HRHg-gWnlqabUBPw9nUrjsOc4QkZvEYGjoeAGrtVPvEQFYBEpdFGhFjBlM8wDxPWvsvNSwUgU5LDys0U-eY7eNf-MxX7LGmSdaTTP7ifqp1UukQ5Z3qHBPg_gCrS3rwPQhSQCLfKw3kzPZ5xLkXLqOJwW8SOrVWmlIuW4lLIZeRmv1ROfHvEMS0FvVi6QhSn7sdPG3-FdUFstmAXC2srhzW-PkEunB6rBtgGb4A33icY0m8VTpgiTCTRah-VufFQ1WM1oeAxn8SREteiP2CtH-k901k3FUUkRk1Be7N2w0WhG1a3Jj77rgAcJSci-gmNlA_90SG2sqJePqnwwNMxjDSktFMxhOmjI1WulJtn7DFfb-ZKrJ0kvCEegQQnen5ySuCX_48MlkkyDrDq7asNujOq4UEgcp77t3wY9ouLYydvs1p8l2VbIZAUTHvOY1ZW6d4Cxb_OEb8qHrbH2PS4uWv5H2QY7HJj2DvYCObVrfKiLvA_z3o-76XTkbBg_9NtRYA&state=3216797e-8f63-4d1b-a042-cca0ede3db05'
    end

    it 'creates a new user site' do
      expect(create_user_site_response).to eq(
        '_links' => {
          'mfaForm' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/mfa'},
          'updateCredentials' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
          'userSite' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
        },
        'userSite' => {
          '_links' => {
            'delete' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
            'getNextStep' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/step'},
            'mfaForm' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/mfa'},
            'migrationGroup' => {'href' => ''},
            'refresh' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/refresh'},
            'renewAccess' =>
              {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
            'renewConsent' =>
              {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6/renew-access'},
            'site' => {'href' => '/site-management/sites/ca8a362a-a351-4358-9f1c-a8b4b91ed65b'},
            'updateCredentials' => {'href' => '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6'},
          },
          'action' => nil,
          'externalConsentExpiresAt' => '2020-06-08T15:13:52.060Z',
          'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
          'lastDataFetch' => nil,
          'migrationStatus' => 'NONE',
          'noLongerSupported' => false,
          'reason' => nil,
          'site' => nil,
          'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
          'status' => 'LOGIN_SUCCEEDED',
          'statusTimeoutSeconds' => nil,
        },
        'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
      )
    end
  end
end
