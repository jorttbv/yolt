# frozen_string_literal: true

require 'yolt/request_token'

require 'yolt/error'

require 'yolt/resources/resource'
require 'yolt/resources/public_resource'
require 'yolt/resources/protected_resource'

require 'yolt/resources/access_tokens'
require 'yolt/resources/client_users'
require 'yolt/resources/sites'
require 'yolt/resources/site'
require 'yolt/resources/user_sites'
require 'yolt/resources/user_site'
require 'yolt/resources/health'
require 'yolt/resources/accounts'
require 'yolt/resources/transactions'

module Yolt
  class Client
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def access_tokens
      Resources::AccessTokens.new(self)
    end

    def client_users
      Resources::ClientUsers.new(self)
    end

    def sites
      Resources::Sites.new(self)
    end

    def site(id)
      Resources::Site.new(self, id)
    end

    def user_sites
      Resources::UserSites.new(self)
    end

    def user_site(id)
      Resources::UserSite.new(self, id)
    end

    def health
      Resources::Health.new(self)
    end

    def accounts
      Resources::Accounts.new(self)
    end

    def transactions
      Resources::Transactions.new(self)
    end

    def access_token
      @access_token ||= create_access_token
    end

    private

    def create_access_token
      access_tokens.create(request_token: request_token)['access_token']
    end

    def request_token
      RequestToken.create(
        configuration.client_id,
        configuration.request_token_public_key_id,
        configuration.private_key_path,
      )
    end
  end
end
