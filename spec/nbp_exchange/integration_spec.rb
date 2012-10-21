require 'spec_helper'

describe 'Currency rate' do

  describe 'averate_exchange_rate' do
    let(:currency) { NbpExchange::Currency.new(CURRENCY_SYMBOL) }

    context 'when date after 2012-09-26' do
      let(:date) { Date.parse("2012-10-19") }

      it 'returns rate for given date' do
        currency.rate(date).average_exchange_rate.should == 4.1103
      end
    end

    context 'date before 2012-09-26' do
      let(:date) { Date.parse("2012-09-25") }

      it 'returns rate for given date' do
        currency.rate(date).average_exchange_rate.should == 4.1475
      end
    end
  end
end
