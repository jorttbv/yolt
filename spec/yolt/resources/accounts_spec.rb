# frozen_string_literal: true

describe Yolt::Resources::Accounts, :configured, :vcr do
  let(:accounts) { Yolt.client.accounts }

  describe '#index' do
    subject(:list_accounts_response) { accounts.index(client_user_id: TEST_CLIENT_USER_ID) }

    it 'returns all accounts' do
      # rubocop:disable Layout/LineLength
      expect(list_accounts_response).to eq(
        [
          {
            'accounts' =>
                         [
                           {
                             '_links' =>
                                             {
                                               'hideAccounts' =>
                                                                 {'href' => '/accounts/user-accounts/me/accounts/hide-unhide'},
                                               'icon' =>
                                               {'href' =>
                                                 '/content/images/sites/icons/ca8a362a-a351-4358-9f1c-a8b4b91ed65b.png',
                             },
                                               'logo' =>
                                               {'href' =>
                                                 '/content/images/sites/logos/ca8a362a-a351-4358-9f1c-a8b4b91ed65b.png',
                             },
                                               'savingsGoals' =>
                                               {'href' =>
                                                 '/savings/me/saving-goals/goals/13d4e396-2871-44d3-9400-5e743c73c405/configs',
                             },
                                               'transactions' =>
                                               {'href' =>
                                                 '/transactions/transactions-by-account/me?accountId=13d4e396-2871-44d3-9400-5e743c73c405',
                             },
                                               'updateAccount' =>
                                               {'href' =>
                                                 '/accounts/user-accounts/me/accounts/13d4e396-2871-44d3-9400-5e743c73c405',
                             },
                                               'userSite' =>
                                               {'href' =>
                                                 '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6',
                             },
                                             },
                             'accountMaskedIdentification' => nil,
                             'accountNumber' =>
                            {
                              'holderName' => 'ING',
                              'identification' => '23885922222222',
                              'scheme' => 'SORTCODEACCOUNTNUMBER',
                              'secondaryIdentification' => nil,
                            },
                             'availableBalance' => 100.0,
                             'balance' => 100.0,
                             'closed' => false,
                             'currencyCode' => 'GBP',
                             'customAccountNumber' => nil,
                             'externalId' => '2',
                             'hidden' => false,
                             'id' => '13d4e396-2871-44d3-9400-5e743c73c405',
                             'lastRefreshed' => '2020-03-10T15:13:53+0000',
                             'migrated' => false,
                             'name' => 'ING',
                             'nickname' => nil,
                             'status' => 'DATASCIENCE_FINISHED',
                             'type' => 'CURRENT_ACCOUNT',
                             'updated' => '2020-03-10T15:13:53+0000',
                             'userSite' =>
                            {
                              'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
                              'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
                            },
                           },
                           {
                             '_links' =>
                                              {
                                                'hideAccounts' =>
                                                                   {'href' => '/accounts/user-accounts/me/accounts/hide-unhide'},
                                                'icon' =>
                                                {'href' =>
                                                  '/content/images/sites/icons/0e11711f-5353-4076-bce5-cc50e8703b77.png',
                             },
                                                'logo' =>
                                                {'href' =>
                                                  '/content/images/sites/logos/0e11711f-5353-4076-bce5-cc50e8703b77.png',
                             },
                                                'savingsGoals' =>
                                                {'href' =>
                                                  '/savings/me/saving-goals/goals/6976411d-026e-42b0-b8a9-cb40c1944606/configs',
                             },
                                                'transactions' =>
                                                {'href' =>
                                                  '/transactions/transactions-by-account/me?accountId=6976411d-026e-42b0-b8a9-cb40c1944606',
                             },
                                                'updateAccount' =>
                                                {'href' =>
                                                  '/accounts/user-accounts/me/accounts/6976411d-026e-42b0-b8a9-cb40c1944606',
                             },
                                                'userSite' =>
                                                {'href' =>
                                                  '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6',
                             },
                                              },
                             'accountMaskedIdentification' => nil,
                             'accountNumber' =>
                             {
                               'holderName' => 'HSBC',
                               'identification' => '40110011111111',
                               'scheme' => 'SORTCODEACCOUNTNUMBER',
                               'secondaryIdentification' => nil,
                             },
                             'availableBalance' => 200.0,
                             'balance' => 200.0,
                             'closed' => false,
                             'currencyCode' => 'GBP',
                             'customAccountNumber' => nil,
                             'externalId' => '1',
                             'hidden' => false,
                             'id' => '6976411d-026e-42b0-b8a9-cb40c1944606',
                             'lastRefreshed' => '2020-03-10T15:13:53+0000',
                             'migrated' => false,
                             'name' => 'HSBC',
                             'nickname' => nil,
                             'status' => 'DATASCIENCE_FINISHED',
                             'type' => 'CURRENT_ACCOUNT',
                             'updated' => '2020-03-10T15:13:53+0000',
                             'userSite' =>
                             {
                               'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
                               'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
                             },
                           },
                           {
                             '_links' =>
                                              {
                                                'hideAccounts' =>
                                                                   {'href' => '/accounts/user-accounts/me/accounts/hide-unhide'},
                                                'icon' =>
                                                {'href' =>
                                                  '/content/images/sites/icons/41de5024-d22e-4d24-b295-fd90a4fed926.png',
                             },
                                                'logo' =>
                                                {'href' =>
                                                  '/content/images/sites/logos/41de5024-d22e-4d24-b295-fd90a4fed926.png',
                             },
                                                'savingsGoals' =>
                                                {'href' =>
                                                  '/savings/me/saving-goals/goals/bb37c8b9-c421-43ec-bd14-4714a2c4dec5/configs',
                             },
                                                'transactions' =>
                                                {'href' =>
                                                  '/transactions/transactions-by-account/me?accountId=bb37c8b9-c421-43ec-bd14-4714a2c4dec5',
                             },
                                                'updateAccount' =>
                                                {'href' =>
                                                  '/accounts/user-accounts/me/accounts/bb37c8b9-c421-43ec-bd14-4714a2c4dec5',
                             },
                                                'userSite' =>
                                                {'href' =>
                                                  '/site-management/user-sites/61e57f53-8f71-43c6-afb3-702c2a5451e6',
                             },
                                              },
                             'accountMaskedIdentification' => nil,
                             'accountNumber' =>
                             {
                               'holderName' => 'Barclays',
                               'identification' => 'GB92BARC20005275849855',
                               'scheme' => 'IBAN',
                               'secondaryIdentification' => nil,
                             },
                             'availableBalance' => 300.0,
                             'balance' => 300.0,
                             'closed' => false,
                             'currencyCode' => 'GBP',
                             'customAccountNumber' => nil,
                             'externalId' => '3',
                             'hidden' => false,
                             'id' => 'bb37c8b9-c421-43ec-bd14-4714a2c4dec5',
                             'lastRefreshed' => '2020-03-10T15:13:53+0000',
                             'migrated' => false,
                             'name' => 'Barclays',
                             'nickname' => nil,
                             'status' => 'DATASCIENCE_FINISHED',
                             'type' => 'CURRENT_ACCOUNT',
                             'updated' => '2020-03-10T15:13:53+0000',
                             'userSite' =>
                             {
                               'id' => '61e57f53-8f71-43c6-afb3-702c2a5451e6',
                               'siteId' => 'ca8a362a-a351-4358-9f1c-a8b4b91ed65b',
                             },
                           },
                         ],
            'totals' => [{'currencyCode' => 'GBP', 'total' => 600.0}],
            'type' => 'FOREIGN_CURRENCY',
          },
        ],
      )
      # rubocop:enable Layout/LineLength
    end
  end
end
