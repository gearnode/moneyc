class FixerHttpClientError
end

module CurrencyConverter
  class FixerHttpClient
    API_URL = 'http://api.fixer.io'

     def self.get_rate(date, base_currency)
      uri = generate_uri(date, base_currency)
      response = http.get(uri)
      JSON.parse(response, { symbolize_names: true})[:rates]
    end

    private

    def self.generate_uri(date, base_currency)
      URI "#{API_URL}/#{date}?base=#{base_currency}"
    end

    def self.http
      Net::HTTP
    end
  end
end
