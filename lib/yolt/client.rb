# frozen_string_literal: true

require 'yolt/thread_safe_access_token_cache'
require 'yolt/request_token'
require 'yolt/status_code'
require 'yolt/content_type'
require 'yolt/error'
require 'yolt/error_code'
require 'yolt/response_handler'
require 'yolt/resource'
require 'yolt/public_resource'
require 'yolt/protected_resource'

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
      Resources::AccessTokens.new(@configuration)
    end

    def client_users
      Resources::ClientUsers.new(@configuration)
    end

    def sites
      Resources::Sites.new(@configuration)
    end

    def site(id)
      Resources::Site.new(@configuration, id)
    end

    def user_sites
      Resources::UserSites.new(@configuration)
    end

    def user_site(id)
      Resources::UserSite.new(@configuration, id)
    end

    def health
      Resources::Health.new(@configuration)
    end

    def accounts
      Resources::Accounts.new(@configuration)
    end

    def transactions
      Resources::Transactions.new(@configuration)
    end
  end
end
