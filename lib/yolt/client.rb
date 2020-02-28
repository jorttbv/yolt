# frozen_string_literal: true

module Yolt
  class Client
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end
  end
end
