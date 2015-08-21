require 'net/http'
require 'date'
require 'json'

require 'currency_converter/error'
require 'currency_converter/fixer_http_client'
require 'currency_converter/currency'

module CurrencyConverter
  FixerHttpClient
  Currency
end

CC = CurrencyConverter::Currency
