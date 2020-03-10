# frozen_string_literal: true

describe Yolt::Resources::Transactions, :configured, :vcr do
  let(:transactions) { Yolt.client.transactions }

  describe '#by_account' do
    subject(:transactions_by_account) do
      transactions.by_account(client_user_id: TEST_CLIENT_USER_ID, account_id: '13d4e396-2871-44d3-9400-5e743c73c405')
    end

    it 'returns transactions' do
      expect(transactions_by_account['transactions']).to_not be_empty
    end
  end

  describe '#by_date' do
    subject(:transactions_by_date) do
      transactions.by_date(client_user_id: TEST_CLIENT_USER_ID, date_interval: date_interval, currency: currency)
    end
    let(:date_interval) { nil }
    let(:currency) { nil }

    it 'returns transactions' do
      expect(transactions_by_date['transactions']).to_not be_empty
    end

    context 'given a date interval' do
      let(:date_interval) { '2020-01-01/2020-04-01' }

      it 'returns transactions' do
        expect(transactions_by_date['transactions']).to_not be_empty
      end
    end

    context 'given a currency' do
      let(:currency) { 'GBP' }

      it 'returns transactions' do
        expect(transactions_by_date['transactions']).to_not be_empty
      end
    end
  end
end
