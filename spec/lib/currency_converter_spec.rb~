require 'spec_helper'
require 'pry'

describe CurrencyConverter do

  context described_class::Currency do
    subject { described_class }
    let(:total_currency) { 12 }

    it 'convert method without arguements' do
      expect{ described_class.convert }.to raise_error(ArgumentError)
    end

    it 'should raise unknow currency' do
      expect{ described_class.convert(total_currency, from: 'QQQ') }.to raise_error(CurrencyConverter::CurrencyUnknown)
      expect{ described_class.convert(total_currency, from: 'EUR', to: 'QQQ' ) }.to raise_error(CurrencyConverter::CurrencyUnknown)
    end

    it 'when currency_from equal to currency_to should rate return one' do
      expect( described_class.convert(total_currency, from: 'EUR', to: 'EUR').rate ).to eq(1)
    end

    it 'when curency_from equal to currency_to should take return total_currency' do
      expect( described_class.convert(total_currency, from: 'EUR', to: 'EUR').take ).to eq(12)
    end
  end
end
