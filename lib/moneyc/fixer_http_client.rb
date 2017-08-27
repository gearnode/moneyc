module Moneyc
  class FixerHTTPClient
    API_PROTOCOL = 'https://'.freeze
    BASE_API_URL = 'api.fixer.io'.freeze

    def initialize(conversion_date:, reference_currency:)
      @conversion_date = conversion_date.strftime('%Y-%m-%d')
      @reference_currency = reference_currency.to_s
      @uri = construct_uri
    end

    def fetch_currency_rate
      retrieve_rate
    end

    private

    def construct_uri
      URI("#{ API_PROTOCOL }#{ BASE_API_URL }/#@conversion_date/?base=#@reference_currency")
    end

    def retrieve_rate
      JSON.parse(call_api, { symbolize_names: true }).fetch(:rates)
    rescue KeyError
      fail ArgumentError, 'target currency is not available'
    end

    def call_api
      http_client.get(@uri)
    end

    def http_client
      Net::HTTP
    end
  end
end
