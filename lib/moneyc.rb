require 'net/http'
require 'date'
require 'json'

module Moneyc
  AVAILABLE_CURRENCY = [:AUD, :BGN, :BRL, :CAD, :CHF,
    :CNY, :CZK, :DKK, :GBP, :HKD, :HRK, :HUF, :IDR,
    :ILS, :INR, :JPY, :KRW, :MXN, :MYR, :NOK, :NZD,
    :PHP, :PLN, :RON, :RUB, :SEK, :SGD, :THB, :TRY,
    :USD, :ZAR, :EUR]

  autoload :FixerHTTPClient, 'moneyc/fixer_http_client'
  autoload :Converter,       'moneyc/converter'
end
