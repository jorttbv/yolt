# frozen_string_literal: true

module Yolt
  module Resources
    class Sites < Base
      def index(redirect_url_id: nil)
        get(
          'site-management/v2/sites',
          {}.tap do |params|
            params[:redirectUrlId] = redirect_url_id if redirect_url_id
          end,
        )
      end
    end
  end
end
