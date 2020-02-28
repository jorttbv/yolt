# frozen_string_literal: true

require 'yolt/version'
require 'yolt/client'
require 'yolt/configuration'

module Yolt
  class << self
    attr_accessor :configuration

    def reset_configuration
      @configuration = Configuration.default
    end

    def configure(&_block)
      yield(configuration)
    end

    def client
      Client.new(configuration.dup)
    end
  end

  reset_configuration
end
