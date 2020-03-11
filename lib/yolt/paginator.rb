# frozen_string_literal: true

require 'uri'

module Yolt
  class Paginator
    def initialize(resource, list_key)
      @resource = resource
      @list_key = list_key
    end

    def paginate(headers: {}, params: {})
      next_param = nil

      Enumerator.new do |yielder|
        loop do
          result = @resource.get(headers: headers, params: params.tap { |x| x['next'] = next_param if next_param })
          result[@list_key].each do |item|
            yielder << item
          end

          next_param = extract_next_param(result)
          fail StopIteration if next_param.nil?
        end
      end
    end

    private

    def extract_next_param(result)
      links = result['_links']
      fail 'Missing _links in paginated response' unless links

      next_link = links['next']
      return if next_link.nil?

      params = extract_params(next_link['href'])
      params['next'].first
    end

    def extract_params(href)
      uri = URI(href)
      CGI.parse(uri.query)
    end
  end
end
