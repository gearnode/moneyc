module CurrencyConverter
  class CurrencyConverterError < StandardError
  end

  class CurrencyUnknown < CurrencyConverterError
  end
end
