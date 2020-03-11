# frozen_string_literal: true

require 'thread_safe'

module Yolt
  class ThreadSafeAccessTokenCache
    CACHE_KEY = 'CURRENT_YOLT_ACCESS_TOKEN'

    def initialize
      clear!
    end

    def get(&block)
      @cache.fetch_or_store(CACHE_KEY) { block.call if block_given? }
    end

    def clear!
      @cache = ThreadSafe::Cache.new
    end
  end
end
