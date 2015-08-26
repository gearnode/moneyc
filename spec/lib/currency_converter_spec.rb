require 'spec_helper'
require 'pry'

describe CurrencyConverter do

  context described_class::Currency do
    let(:total_currency) { 12 }

    it 'convert method without arguements' do
      expect{ described_class.convert }.to raise_error(ArgumentError)
    end

    it 'should raise unknow currency' do
      expect{ described_class.convert(total_currency, base: 'QQQ') }.to raise_error(CurrencyConverter::CurrencyUnknown)
      expect{ described_class.convert(total_currency, base: 'EUR', to: 'QQQ' ) }.to raise_error(CurrencyConverter::CurrencyUnknown)
    end

    context 'when base currency equal currency_to' do

      it 'should rate return one' do
        expect( described_class.convert(total_currency, base: 'EUR', to: 'EUR').rate ).to eq(1)
      end

      it 'should return total_currency' do
        expect( described_class.convert(total_currency, base: 'EUR', to: 'EUR').take ).to eq(12)
      end
    end

    context 'when base_currency different currency_to' do

      it 'should return rate at 2000/01/03' do
        expect( described_class.convert(total_currency, base: 'EUR', to: 'USD', at: '2000-01-03').rate ).to eq(1.009)
      end

      it 'should return total_currency converted in USD at 2000/01/03' do
        expect( described_class.convert(total_currency, base: 'EUR', to: 'USD', at: '2000-01-03').take ).to eq(12.107999999999999)
      end
    end
  end
end
