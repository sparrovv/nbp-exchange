require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe Rate do
    let(:currency) { stub('Currency') }
    let(:rate){ Rate.new(currency, EXCHANGE_DATE, '12,12') }

    it 'has date' do
      rate.date.should == EXCHANGE_DATE
    end

    it 'has currency' do
      rate.currency.should == currency
    end

    it 'has average_exchange_rate in float' do
      rate.average_exchange_rate.should == 12.12
    end

    it 'can pass numeric as average_exchange_rate' do
      rate = Rate.new(currency, EXCHANGE_DATE, 12.11)
      rate.average_exchange_rate.should == 12.11
    end
  end
end
