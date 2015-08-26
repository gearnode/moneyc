require 'spec_helper'

describe Moneyc::Converter do

  describe '#rate' do
    subject{ described_class.new(from: reference_currency, to: target_currency, at: date).rate }
    
    let(:date){ Time.new('2015', '8', '20') }

    context 'when reference and target currency is same' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'USD' }

      it 'returns 1' do
        expect(subject).to eq(1)
      end
    end

    context 'when reference and target currency is not same' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'EUR' }

      it 'returns 0.89421' do
        expect(subject).to eq(0.89421)
      end
    end

    context 'when target currency is not present' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ '' }

      it 'returns 1' do
        expect(subject).to eq(1)
      end
    end

    context 'when conversion date is not present' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'EUR' }
      let(:date){ nil }

      before do
        Timecop.freeze(Time.new('2015', '8', '20'))
      end

      it 'returns rate at now date' do
        expect(subject).to eq(0.89421)
      end

      after do
        Timecop.return
      end
    end

    context 'when reference or target currency is not available' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'ISNOTACURRENCY' }

      it 'raises a error' do
        expect{ subject }.to raise_error(Moneyc::Converter::ConverterError)
      end
    end
  end

  describe '#convert' do
    subject{ described_class.new(money: 7, from: reference_currency, to: target_currency, at: date).convert }

    let(:date){ Time.new('2015', '8', '20') }

    context 'when reference and target is same' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'USD' }

      it 'returns 7' do
        expect(subject).to eq(7)
      end
    end

    context 'when reference and target currency is not same' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'EUR' }

      it 'returns rate * total in target reference at 2015-8-20' do
        expect(subject).to eq(6.259469999999999)
      end
    end

    context 'when target currency is not present' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ '' }

      it 'returns total in reference currency' do
        expect(subject).to eq(7)
      end
    end

    context 'when conversion date is not present' do
      let(:reference_currency){ 'USD' }
      let(:target_currency){ 'EUR' }
      let(:date){ nil }

      before do
        Timecop.freeze(Time.new('2015', '8', '20'))
      end

      it 'return rate * total in target currency at now date' do
        expect(subject).to eq(6.259469999999999)
      end

      after do
        Timecop.return
      end
    end

    context 'when reference or target currency is not available' do
      let(:reference_currency){ 'ISNOTACURRENCY' }
      let(:target_currency){ 'USD' }

      it 'raises error' do
        expect{ subject }.to raise_error(Moneyc::Converter::ConverterError)
      end
    end
  end
end