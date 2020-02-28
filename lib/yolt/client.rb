# frozen_string_literal: true

require 'yolt/request_token'

require 'yolt/resources/base'
require 'yolt/resources/access_tokens'
module Yolt
  class Client
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def access_tokens
      Resources::AccessTokens.new(self)
    end
  end
end
