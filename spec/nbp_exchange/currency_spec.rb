require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe Currency do

    let!(:currency){Currency.new(CURRENCY_SYMBOL)}

    describe "#name" do
      it "shoud have name" do
        currency.name.should == "Euro"
      end
    end

    describe "#rate" do
      let(:expected){Rate.new(currency, EXCHANGE_DATE, 4.4146)}

      it "should return average rate for given date" do
        r = currency.rate(EXCHANGE_DATE)
        r.average_exchange_rate.should == expected.average_exchange_rate
      end
    end
  end
end
