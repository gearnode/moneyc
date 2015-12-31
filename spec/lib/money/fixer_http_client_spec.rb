require 'spec_helper'

describe Moneyc::FixerHTTPClient do

  describe '#fetch_currency_rate' do
    subject{ described_class.new(conversion_date: conversion_date, reference_currency: reference_currency).fetch_currency_rate }

    let(:conversion_date){ Time.new('2015', '10', '24') }

    context 'when reference_currency is available' do
      let(:reference_currency){ :USD }

      it 'returns hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns hash with eur' do
        expect(subject[:EUR]).not_to be_nil
      end
    end

    context 'when reference_currency is not available' do
      let(:reference_currency){ :WDFGYUJI }

      it 'raises error' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end
  end
end
