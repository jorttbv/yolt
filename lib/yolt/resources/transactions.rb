# frozen_string_literal: true

module Yolt
  module Resources
    class Transactions
      def initialize(client)
        @by_account_resource = ProtectedResource.new(client, 'transactions/transactions-by-account/me')
        @by_date_resource = ProtectedResource.new(client, 'transactions/transactions-by-date/me')
      end

      def by_account(client_user_id:, account_id:)
        Paginator
          .new(@by_account_resource, 'transactions')
          .paginate(
            headers: {
              'client-user-id' => client_user_id,
            },
            params: {
              accountId: account_id,
            },
          )
      end

      def by_date(client_user_id:, date_interval: nil, currency: nil, excluded_account: nil)
        Paginator
          .new(@by_date_resource, 'transactions')
          .paginate(
            headers: {
              'client-user-id' => client_user_id,
            },
            params: {}.tap do |params|
              params[:dateInterval] = date_interval if date_interval
              params[:currency] = currency if currency
              params[:excludedAccount] = excluded_account if excluded_account
            end,
          )
      end
    end
  end
end
