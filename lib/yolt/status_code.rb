# frozen_string_literal: true

module Yolt
  # See https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
  class StatusCode
    # sucessful
    SUCCESSFUL_RANGE = (200..299).freeze
    OK = 200
    CREATED = 201
    ACCEPTED = 202
    NO_CONTENT = 204

    # client error
    CLIENT_ERROR_RANGE = (400..499).freeze
    BAD_REQUEST = 400
    UNAUTHORIZED = 401
    FORBIDDEN = 403
    NOT_FOUND = 404
    METHOD_NOT_ALLOWED = 405
    NOT_ACCEPTABLE = 406
    CONFLICT = 409
    GONE = 410

    # server error
    SERVER_ERROR_RANGE = (500..599).freeze
    INTERNAL_SERVER_ERROR = 500
    SERVICE_UNAVAILABLE = 503
  end
end
