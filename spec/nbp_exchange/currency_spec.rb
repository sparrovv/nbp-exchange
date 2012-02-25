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
      context "When rate exists" do
        let(:expected){Rate.new(currency, EXCHANGE_DATE, 4.4146)}

        it "should return average rate for given date" do
          r = currency.rate(EXCHANGE_DATE)
          r.average_exchange_rate.should == expected.average_exchange_rate
        end
      end

      context "when rate doesn't exists for this date" do

        it "should raise error by default" do
          lambda {
            r = currency.rate("2001-01-01")
          }.should raise_error(NbpExchange::NoXMLForThisDate)
        end

        context "module is configured to get last possible rate" do

          it "should have property to set options to gather rate from last working day" do
            NbpExchange::Config::get_rate_from_last_working_date.should_not be_nil
            NbpExchange::Config::get_rate_from_last_working_date.should be_false
          end

          it "should get last rate from the last working day" do
            NbpExchange::Config::get_rate_from_last_working_date = true

            lambda {
              @r = currency.rate("2012-02-25")
            }.should_not raise_error

            @r.date.should == Date.parse("2012-02-24")
          end

        end

      end
    end
  end
end
