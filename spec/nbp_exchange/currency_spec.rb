require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe Currency do

    let!(:currency){ Currency.new(CURRENCY_SYMBOL) }

    describe "#name" do
      it "shoud have name" do
        expect(currency.name).to eq "Euro"
      end
    end

    describe "#rate" do
      context "When rate exists" do
        let(:expected){ Rate.new(currency, EXCHANGE_DATE, 4.4146) }

        it "should return average rate for given date" do
          r = currency.rate(EXCHANGE_DATE)
          expect(r.average_exchange_rate).to eq expected.average_exchange_rate
        end
      end

      context "when rate doesn't exists for this date" do
        it "should raise error" do
          expect {
            currency.rate("2001-01-01")
          }.to raise_error(NbpExchange::NoXMLForThisDate)
        end
      end
    end
  end
end
