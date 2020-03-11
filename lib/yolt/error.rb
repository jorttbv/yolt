# frozen_string_literal: true

module Yolt
  class Error < StandardError
    attr_reader :status_code, :error_code

    # client errors
    ClientError = Class.new(self)
    BadRequest = Class.new(ClientError)
    Unauthorized = Class.new(ClientError)
    Forbidden = Class.new(ClientError)
    NotFound = Class.new(ClientError)
    MethodNotAllowed = Class.new(ClientError)
    NotAcceptable = Class.new(ClientError)
    Conflict = Class.new(ClientError)
    Gone = Class.new(ClientError)

    # server errors
    ServerError = Class.new(self)
    InternalServerError = Class.new(ServerError)
    ServiceUnavailable = Class.new(ServerError)

    STATUS_CODE_TO_ERROR_CLASS = {
      # client errors
      StatusCode::BAD_REQUEST => BadRequest,
      StatusCode::UNAUTHORIZED => Unauthorized,
      StatusCode::FORBIDDEN => Forbidden,
      StatusCode::NOT_FOUND => NotFound,
      StatusCode::METHOD_NOT_ALLOWED => MethodNotAllowed,
      StatusCode::NOT_ACCEPTABLE => NotAcceptable,
      StatusCode::CONFLICT => Conflict,
      StatusCode::GONE => Gone,

      # server errors
      StatusCode::INTERNAL_SERVER_ERROR => InternalServerError,
      StatusCode::SERVICE_UNAVAILABLE => ServiceUnavailable,
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

    def initialize(message, status_code, error_code = nil)
      super(message)

      @status_code = status_code
      @error_code = error_code
    end
  end
end
