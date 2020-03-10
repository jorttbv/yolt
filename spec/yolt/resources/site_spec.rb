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
    let(:client_user_id) { '94913058-99a1-402d-b5c9-1840ed7a982b' }

    subject(:initiate_user_site_response) do
      site.initiate_user_site(client_user_id: client_user_id, redirect_url_id: '4c85be05-9aa3-4532-9c6a-dd0622c06a72')
    end

    it 'returns site initiation details' do
      expect(initiate_user_site_response).to eq(
        '_links' => {'postLoginStep' => {'href' => '/site-management/user-sites'}},
        'redirect' => {
          'url' => 'https://yoltbank.sandbox.yolt.io/yoltbank/openbanking/v3/authorize?response_type=code+id_token&client_id=d0c45812-6364-45ce-97c4-b37c3cfc252f&state=9edd8168-4944-484e-a438-3f0977d98b7f&scope=openid+accounts&nonce=9edd8168-4944-484e-a438-3f0977d98b7f&redirect_uri=http%3A%2F%2Flocalhost%3A9292%2Fyolt%2Foauth_callback&request=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA3ZTVjNTgwLTNiOWQtNDI4MS1hODRjLWI3ZGNjMDAwYTcyNyJ9.eyJpc3MiOiJkMGM0NTgxMi02MzY0LTQ1Y2UtOTdjNC1iMzdjM2NmYzI1MmYiLCJhdWQiOiJZb2x0YmFuayIsInJlc3BvbnNlX3R5cGUiOiJjb2RlIGlkX3Rva2VuIiwiY2xpZW50X2lkIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwicmVkaXJlY3RfdXJpIjoiaHR0cDovL2xvY2FsaG9zdDo5MjkyL3lvbHQvb2F1dGhfY2FsbGJhY2siLCJzY29wZSI6Im9wZW5pZCBhY2NvdW50cyIsInN0YXRlIjoiOWVkZDgxNjgtNDk0NC00ODRlLWE0MzgtM2YwOTc3ZDk4YjdmIiwibm9uY2UiOiI5ZWRkODE2OC00OTQ0LTQ4NGUtYTQzOC0zZjA5NzdkOThiN2YiLCJtYXhfYWdlIjo4NjQwMCwic3ViIjoiZDBjNDU4MTItNjM2NC00NWNlLTk3YzQtYjM3YzNjZmMyNTJmIiwiZXhwIjoxNTgzODQ3OTU5LCJpYXQiOjE1ODM4NDczNTksImp0aSI6IlBVNEdGR1gzVWhzSFVSNzh0Q3dQMFEiLCJjbGFpbXMiOnsidXNlcmluZm8iOnsib3BlbmJhbmtpbmdfaW50ZW50X2lkIjp7InZhbHVlIjoiNWFmOTliN2YtMTc2Zi00YTQ0LTlmZjUtYmQ4ZjNjNzg3NzE2IiwiZXNzZW50aWFsIjp0cnVlfX0sImlkX3Rva2VuIjp7Im9wZW5iYW5raW5nX2ludGVudF9pZCI6eyJ2YWx1ZSI6IjVhZjk5YjdmLTE3NmYtNGE0NC05ZmY1LWJkOGYzYzc4NzcxNiIsImVzc2VudGlhbCI6dHJ1ZX0sImFjciI6eyJlc3NlbnRpYWwiOnRydWUsInZhbHVlcyI6WyJ1cm46b3BlbmJhbmtpbmc6cHNkMjpzY2EiLCJ1cm46b3BlbmJhbmtpbmc6cHNkMjpjYSJdfX19fQ.gGgJQjefxYz7AXtWE84J_WVzLoJIPaOxcTNeodVe2sVIqF91uHkCn9Ye71jbZ479dlm5VyiXvZ8EhV6pzwVtGdcSqOMg2CtWOyb3nLEI3nWHKva1UzSP_z9MfJw31je61lFxWXFZNnmoRgTFH1z20DzBfaRIZf6tAUfKEHv_ERZp5fHKawSB6hMMGffjcTlyp_aK3b5BfCQQF_S0yYSGrlA_H3a-pHlw8Cuemcf0zT3V4nACrBRm52JL1DdshGEr0iJhiFMb0-EnQ1eOBwj7644FA8pcU0euORUlp7u5fSXZs5cna7Kq8YPWsmvcTs7CLMvrULGMxrbiSwFEn1W6hg',
        },
        'userSiteId' => 'b48622c7-4a98-48b3-a57e-8aa85fe84f9d',
      )
    end
  end
end
