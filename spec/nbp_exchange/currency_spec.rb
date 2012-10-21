require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe Currency do

    let!(:currency){ Currency.new(CURRENCY_SYMBOL) }

    describe "#name" do
      it "shoud have name" do
        currency.name.should == "Euro"
      end
    end

    describe "#rate" do
      context "When rate exists" do
        let(:expected){ Rate.new(currency, EXCHANGE_DATE, 4.4146) }

        it "should return average rate for given date" do
          r = currency.rate(EXCHANGE_DATE)
          r.average_exchange_rate.should == expected.average_exchange_rate
        end
      end

      context "when rate doesn't exists for this date" do
        it "should raise error" do
          lambda {
            r = currency.rate("2001-01-01")
          }.should raise_error(NbpExchange::NoXMLForThisDate)
        end
      end
    end
  end
end
