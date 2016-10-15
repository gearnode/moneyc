module Moneyc
  class Converter
    def initialize(from:, to: nil, at: nil)
      @reference_currency = from
      @target_currency = presence(to) || @reference_currency
      @conversion_date = presence(at) || Time.now
    end

    def rate
      if reference_and_target_is_same?
        1
      else
        retrieve_taget_currency_rate
      end
    end

    def convert(total_in_reference_currency)
      total_in_reference_currency.to_f * rate
    end

    private

    def presence(object)
      object if !(object.respond_to?(:empty?) ? !!object.empty? : !object)
    end

    def reference_and_target_is_same?
      @reference_currency == @target_currency
    end

    def retrieve_taget_currency_rate
      if http_response.nil? || http_response[@target_currency.to_sym].nil?
        fail ArgumentError, argument_error_message
      else
        http_response[@target_currency.to_sym]
      end
    end

    def argument_error_message
      "#@target_currency or #@reference_currency is not available currency"
    end

    def http_response
      FixerHTTPClient.new(
        conversion_date: @conversion_date,
        reference_currency: @reference_currency
      ).fetch_currency_rate
    end
  end
end
