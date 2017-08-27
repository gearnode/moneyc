module Moneyc
  # This module deal with the fixer.io API using Net::HTTP ruby module.
  class FixerHTTPClient
    def initialize(conversion_date:, reference_currency:)
      @conversion_date = conversion_date.strftime('%Y-%m-%d')
      @reference_currency = reference_currency.to_s
    end

    def fetch_currency_rate
      JSON.parse(response, symbolize_names: true).fetch(:rates)
    rescue KeyError
      raise(ArgumentError, 'target currency is not available')
    end

    private

    def response
      Net::HTTP.get(
        URI::HTTPS.build(
          host: 'api.fixer.io',
          path: "/#{@conversion_date}",
          query: "base=#{@reference_currency}"
        )
      )
    end
  end
end
