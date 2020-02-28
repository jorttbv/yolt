# frozen_string_literal: true

require 'yolt/request_token'

require 'yolt/resources/base'
require 'yolt/resources/tokens'
module Yolt
  class Client
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def tokens
      Resources::Tokens.new(self)
    end
  end
end
