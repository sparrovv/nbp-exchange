require 'spec_helper'

describe 'Average Currency Exchange Rate' do

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

    context 'when sunday or holiday' do
      let(:date) { Date.parse("2012-09-02") }

      it 'returns last available rate' do
        rate = currency.last_available_rate_for(date)
        rate.date.should == Date.new(2012, 8, 31)
        rate.average_exchange_rate.should == 4.1838
      end
    end
  end
end
