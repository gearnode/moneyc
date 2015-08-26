module CurrencyConverter
  class Currency
     AVAILABLE_CURRENCY = [ 'AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CZK', 'DKK', 'GBP', 'HKD',
                            'HRK', 'HUF', 'IDR', 'ILS', 'INR', 'JPY', 'KRW', 'MXN', 'MYR', 'NOK',
                            'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'THB', 'TRY', 'USD',
                            'ZAR', 'EUR' ]

    #  Public: Build currency object with rules.
    #
    #  total_currency - (Fixnum)  - Total currency to convert
    #  options - (Hash)  - from, to (optinal), at (optional)
    #
    # Examples
    #
    #   convert(12, from: 'EUR', to: 'EUR', at: '2015-07-12')
    #   # => <#CurrencyConverter::Currency @total_currency=12, @base_currency='EUR', @currency_to='EUR', @at='2015-07-12'>
    #
    #   convert(12, from: 'EUR', to: 'EUR')
    #   # => <#CurrencyConverter::Currency @total_currency=12, @base_currency='EUR', @currency_to='EUR', @at=Date.today>
    #
    #   convert(12, from: 'EUR')
    #   # => <#CurrencyConverter::Currency @total_currency=12, @base_currency='EUR', @currency_to='EUR', @at=Date.today>
    #
    #   convert(12, from: 'USD', to: 'EUR')
    #   # => <#CurrencyConverter::Currency @total_currency=12, @base_currency="USD", @currency_to="EUR", @at="today date">
    #
    # Returns <#CurrencyConverter::Currency...>

    def self.convert(total_currency, options = {})
      new(options.merge(total_currency: total_currency))
    end

    def initialize(options = {})
      @total_currency     = options.fetch(:total_currency)
      @base_currency      = build_base_currency(options.fetch(:base))
      @currency_to        = build_to_currency(options[:to])
      @currency_rate_date = build_currency_rate_date(options[:at])
    end

    # Public: Get rate
    #
    # Examples
    #
    #   rate
    #   # => 1
    #
    # Returns Fixnum

    def rate
      @rate = if @base_currency == @currency_to
                1
              else
                FixerHttpClient.get_rate(@currency_rate_date, @base_currency)[@currency_to.to_sym]
              end
    end

    # Public: Calculation total_currency in new currency
    #
    # Examples
    #
    #   take
    #   # => 12
    #
    # Returns Fixnum

    def take
      @total_currency * rate
    end

    private

    def build_currency_rate_date(date)
      if date.nil?
        Date.today.to_s
      else
        date
      end
    end

    def build_base_currency(base_currency)
      if AVAILABLE_CURRENCY.include?(base_currency)
        base_currency
      else
        raise CurrencyConverter::CurrencyUnknown
      end
    end

    def build_to_currency(to_currency)
      if to_currency.nil?
        @base_currency
      elsif AVAILABLE_CURRENCY.include?(to_currency)
        to_currency
      else
        raise CurrencyConverter::CurrencyUnknown
      end
    end
  end
end
