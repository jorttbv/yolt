# frozen_string_literal: true

module Yolt
  class Error < StandardError
    attr_reader :status_code, :code

    ClientError = Class.new(self)
    NotFound = Class.new(ClientError)
    Gone = Class.new(ClientError)

    STATUS_CODE_TO_ERROR_CLASS = {
      404 => NotFound,
      410 => Gone,
    }.freeze

    class << self
      def from_response(response)
        get_error_class(response.code).new(*get_error_arguments(response))
      end

      private

      def get_error_class(code)
        STATUS_CODE_TO_ERROR_CLASS[code] || Error
      end

      def get_error_arguments(response)
        error = parse(response.body)

        [
          error['message'],
          response.code,
          error['code'],
        ]
      end

      def parse(body)
        JSON.parse(body)
      rescue StandardError
        {}
      end
    end

    def initialize(message, status_code, code = nil)
      super(message)

      @status_code = status_code
      @code = code
    end
  end
end
