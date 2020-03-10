# frozen_string_literal: true

describe Yolt::Resources::UserSites, :configured, :vcr do
  let(:user_sites) { Yolt.client.user_sites }
  let(:client_user_id) { '94913058-99a1-402d-b5c9-1840ed7a982b' }

  describe '#index' do
    subject(:list_user_sites_response) { user_sites.index(client_user_id: client_user_id) }

    it 'lists all user sites' do
      expect(list_user_sites_response).to eq(
        [
          {
            '_links' => {
              'delete' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
              'getNextStep' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/step'},
              'mfaForm' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/mfa'},
              'migrationGroup' => {'href' => ''},
              'refresh' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/refresh'},
              'renewAccess' =>
                {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
              'renewConsent' =>
                {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
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
          },
        ],
      )
    end
  end

  describe '#create' do
    subject(:create_user_site_response) do
      user_sites.create(client_user_id: client_user_id, login_type: 'URL', redirect_url: redirect_url)
    end

    let(:redirect_url) do
      'https://yoltbank.sandbox.yolt.io/yoltbank/openbanking/v3/authorize?response_type=code+id_token&client_id=d0c45812-6364-45ce-97c4-b37c3cfc252f&state=9edd8168-4944-484e-a438-3f0977d98b7f&scope=openid+accounts&nonce=9edd8168-4944-484e-a438-3f0977d98b7f&redirect_uri=http%3A%2F%2Flocalhost%3A9292%2Fyolt%2Foauth_callback&request=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA3ZTVjNTgwLTNiOWQtNDI4MS1hODRjLWI3ZGNjMDAwYTcyNyJ9.eyJpc3MiOiJkMGM0NTgxMi02MzY0LTQ1Y2UtOTdjNC1iMzdjM2NmYzI1MmYiLCJhdWQiOiJZb2x0YmFuayIsInJlc3BvbnNlX3R5cGUiOiJjb2RlIGlkX3Rva2VuIiwiY2xpZW50X2lkIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwicmVkaXJlY3RfdXJpIjoiaHR0cDovL2xvY2FsaG9zdDo5MjkyL3lvbHQvb2F1dGhfY2FsbGJhY2siLCJzY29wZSI6Im9wZW5pZCBhY2NvdW50cyIsInN0YXRlIjoiOWVkZDgxNjgtNDk0NC00ODRlLWE0MzgtM2YwOTc3ZDk4YjdmIiwibm9uY2UiOiI5ZWRkODE2OC00OTQ0LTQ4NGUtYTQzOC0zZjA5NzdkOThiN2YiLCJtYXhfYWdlIjo4NjQwMCwic3ViIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwiZXhwIjoxNTgzODQ3OTU5LCJpYXQiOjE1ODM4NDczNTksImp0aSI6IlBVNEdGR1gzVWhzSFVSNzh0Q3dQMFEiLCJjbGFpbXMiOnsidXNlcmluZm8iOnsib3BlbmJhbmtpbmdfaW50ZW50X2lkIjp7InZhbHVlIjoiNWFmOTliN2YtMTc2Zi00YTQ0LTlmZjUtYmQ4ZjNjNzg3NzE2IiwiZXNzZW50aWFsIjp0cnVlfX0sImlkX3Rva2VuIjp7Im9wZW5iYW5raW5nX2ludGVudF9pZCI6eyJ2YWx1ZSI6IjVhZjk5YjdmLTE3NmYtNGE0NC05ZmY1LWJkOGYzYzc4NzcxNiIsImVzc2VudGlhbCI6dHJ1ZX0sImFjciI6eyJlc3NlbnRpYWwiOnRydWUsInZhbHVlcyI6WyJ1cm46b3BlbmJhbmtpbmc6cHNkMjpzY2EiLCJ1cm46b3BlbmJhbmtpbmc6cHNkMjpjYSJdfX19fQ.gGgJQjefxYz7AXtWE84J_WVzLoJIPaOxcTNeodVe2sVIqF91uHkCn9Ye71jbZ479dlm5VyiXvZ8EhV6pzwVtGdcSqOMg2CtWOyb3nLEI3nWHKva1UzSP_z9MfJw31je61lFxWXFZNnmoRgTFH1z20DzBfaRIZf6tAUfKEHv_ERZp5fHKawSB6hMMGffjcTlyp_aK3b5BfCQQF_S0yYSGrlA_H3a-pHlw8Cuemcf0zT3V4nACrBRm52JL1DdshGEr0iJhiFMb0-EnQ1eOBwj7644FA8pcU0euORUlp7u5fSXZs5cna7Kq8YPWsmvcTs7CLMvrULGMxrbiSwFEn1W6hg'
    end

    it 'creates a new user site' do
      expect(create_user_site_response).to eq(
        '_links' => {
          'mfaForm' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/mfa'},
          'updateCredentials' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
          'userSite' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
        },
        'userSite' => {
          '_links' => {
            'delete' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d'},
            'getNextStep' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/step'},
            'mfaForm' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/mfa'},
            'migrationGroup' => {'href' => ''},
            'refresh' => {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/refresh'},
            'renewAccess' =>
              {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
            'renewConsent' =>
              {'href' => '/site-management/user-sites/b48622c7-4a98-48b3-a57e-8aa85fe84f9d/renew-access'},
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
        },
        'userSiteId' => 'b48622c7-4a98-48b3-a57e-8aa85fe84f9d',
      )
    end
  end
end
