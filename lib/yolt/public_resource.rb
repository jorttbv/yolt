# frozen_string_literal: true

module Yolt
  class PublicResource
    include Resource

    def initialize(client, path)
      @rest_resource = create_rest_resource(client, path)
    end

    def post(payload)
      @rest_resource.post(payload, &ResponseHandler.method(:handle_response))
    end
  end
end
