# frozen_string_literal: true

module Yolt
  class ResponseHandler
    class << self
      def handle_response(response, _request, _result)
        case response.code
        when StatusCode::SUCCESSFUL_RANGE
          return JSON.parse(response.body) if response.headers[:content_type].include?(ContentType::JSON)

          response.body
        else
          fail Error.from_response(response)
        end
      end
    end
  end
end
