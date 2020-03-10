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

  describe '#initiate_user_site' do
    subject(:initiate_user_site_response) do
      site.initiate_user_site(
        client_user_id: TEST_CLIENT_USER_ID,
        redirect_url_id: '4c85be05-9aa3-4532-9c6a-dd0622c06a72',
      )
    end

    it 'returns site initiation details' do
      expect(initiate_user_site_response).to eq(
        '_links' => {'postLoginStep' => {'href' => '/site-management/user-sites'}},
        'redirect' => {'url' => 'https://yoltbank.sandbox.yolt.io/yoltbank/openbanking/v3/authorize?response_type=code+id_token&client_id=d0c45812-6364-45ce-97c4-b37c3cfc252f&state=3216797e-8f63-4d1b-a042-cca0ede3db05&scope=openid+accounts&nonce=3216797e-8f63-4d1b-a042-cca0ede3db05&redirect_uri=http%3A%2F%2Flocalhost%3A9292%2Fyolt%2Foauth_callback&request=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA3ZTVjNTgwLTNiOWQtNDI4MS1hODRjLWI3ZGNjMDAwYTcyNyJ9.eyJpc3MiOiJkMGM0NTgxMi02MzY0LTQ1Y2UtOTdjNC1iMzdjM2NmYzI1MmYiLCJhdWQiOiJZb2x0YmFuayIsInJlc3BvbnNlX3R5cGUiOiJjb2RlIGlkX3Rva2VuIiwiY2xpZW50X2lkIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwicmVkaXJlY3RfdXJpIjoiaHR0cDovL2xvY2FsaG9zdDo5MjkyL3lvbHQvb2F1dGhfY2FsbGJhY2siLCJzY29wZSI6Im9wZW5pZCBhY2NvdW50cyIsInN0YXRlIjoiMzIxNjc5N2UtOGY2My00ZDFiLWEwNDItY2NhMGVkZTNkYjA1Iiwibm9uY2UiOiIzMjE2Nzk3ZS04ZjYzLTRkMWItYTA0Mi1jY2EwZWRlM2RiMDUiLCJtYXhfYWdlIjo4NjQwMCwic3ViIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwiZXhwIjoxNTgzODUzNzU3LCJpYXQiOjE1ODM4NTMxNTcsImp0aSI6Ik9SMXU4c3hJdHo0czlQZFgxeVpJenciLCJjbGFpbXMiOnsidXNlcmluZm8iOnsib3BlbmJhbmtpbmdfaW50ZW50X2lkIjp7InZhbHVlIjoiNDFmYWMzZjYtZGQ0Ny00YjljLWFmYzItNDcyNWU5MTk4ZWFjIiwiZXNzZW50aWFsIjp0cnVlfX0sImlkX3Rva2VuIjp7Im9wZW5iYW5raW5nX2ludGVudF9pZCI6eyJ2YWx1ZSI6IjQxZmFjM2Y2LWRkNDctNGI5Yy1hZmMyLTQ3MjVlOTE5OGVhYyIsImVzc2VudGlhbCI6dHJ1ZX0sImFjciI6eyJlc3NlbnRpYWwiOnRydWUsInZhbHVlcyI6WyJ1cm46b3BlbmJhbmtpbmc6cHNkMjpzY2EiLCJ1cm46b3BlbmJhbmtpbmc6cHNkMjpjYSJdfX19fQ.oIn6i3not_Bg1J8vvtp4sey5lKSelzu8s_3R7GkSXr6kBTwmRG5lMpxPt3nzx4ZyFcV6J4ep78wUeO6PK7SdS2CQwd22Y8u-rE_tjsi1w6jVklhKK8Bu91a2qW9c4Woi9S240gWx5To9HLLWjWeXxWrH_PxJvWDvEKLEgwR7NvLVQygzKWhEXwWnpLpwun6PPohjsvR-dxbadazyAF8ZJobgEoDN_lCRsE4xLdGbNnzSoFhZkiLZV-AxwGaIRNcSsoPKQPDk6erIctAhT7nRnr6LW1imIUSFB6K2l0FHnwnAg73DSoMDy7llIIXeoxCax3_XYkChB4K6XIDawnTg_Q'}, # rubocop:disable Layout/LineLength
        'userSiteId' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
      )
    end
  end
end
