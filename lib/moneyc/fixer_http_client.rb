module Moneyc
  class FixerHTTPClient
    API_PROTOCOL = 'http://'
    BASE_API_URL = 'api.fixer.io'

    def initialize(conversion_date:, reference_currency:)
      @conversion_date = conversion_date.strftime('%Y-%m-%d')
      @reference_currency = reference_currency.to_s
    end

    def fetch_currency_rate
      construct_uri
      retrieve_rate
    end

    private

    attr_reader :uri

    def construct_uri
      @uri = URI("#{API_PROTOCOL}#{BASE_API_URL}/#{@conversion_date}/?base=#{@reference_currency}")
    end

    def retrieve_rate
      JSON.parse(call_api, { symbolize_names: true})[:rates]
    end

    def call_api
      http_client.get(uri)
    end

    def http_client
      Net::HTTP
    end
  end
end
