module Moneyc
  class Converter
    def initialize(from:, to: nil, at: nil)
      @reference_currency = from
      @target_currency = to.presence || @reference_currency
      @conversion_date = at.presence || Time.now
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

    def reference_and_target_is_same?
      @reference_currency == @target_currency
    end

    def retrieve_taget_currency_rate
      if http_response.present? &&
          http_response[@target_currency.to_sym].present?

        http_response[@target_currency.to_sym]
      else
        fail ArgumentError, argument_error_message
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
