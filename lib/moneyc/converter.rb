module Moneyc
  class Converter

    def initialize(options = {})
      @money_in_reference_currency  = options[:money]
      @reference_currency           = options.fetch(:from)
      @target_currency              = options[:to].present? ? options[:to] : @reference_currency
      @conversion_date              = options[:at].present? ? options[:at] : Time.now
    end

    def rate
      reference_and_target_is_same? ? 1 : retrieve_taget_currency_rate
    end

    def convert
      if @money_in_reference_currency.present?
        @money_in_reference_currency.to_f * rate
      else
        raise ConverterError.new("You need enter an value to convert")
      end
    end

    private

    def reference_and_target_is_same?
      @reference_currency == @target_currency
    end

    def retrieve_taget_currency_rate
      if http_response.present? && http_response[@target_currency.to_sym].present? 
        http_response[@target_currency.to_sym]
      else
        raise ConverterError.new("#{@target_currency} or #{@reference_currency} is not available currency")
      end
    end

    def http_response
      FixerHTTPClient.new(
        conversion_date: @conversion_date,
        reference_currency: @reference_currency
      ).fetch_currency_rate
    end

    class ConverterError < StandardError; end
  end
end
