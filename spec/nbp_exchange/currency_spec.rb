require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe Currency do

    let(:currency){ Currency.new(CURRENCY_SYMBOL) }
    let(:date) { Date.new(2012, 1, 1) }

    describe "#name" do
      it "shoud have name" do
        currency.name.should == "Euro"
      end
    end

    describe "#rate" do
      it "calls rate builder" do
        currency.should_receive(:load_rate).with(date) { stub }
        currency.rate(date)
      end

      it 'doesn\'t call rate builder twice' do
        currency.should_receive(:load_rate).with(date) { stub('first') }
        currency.rate(date)
        currency.should_not_receive(:load_rate).with(date)
        currency.rate(date)
      end
    end

    describe "#rate_at" do
      it "calls rate builder" do
        currency.should_receive(:load_rate).with(date) { stub }
        currency.rate_at(date)
      end
    end

    describe "#last_available_rate_for" do
      it "calls load_rate" do
        currency.should_receive(:load_rate).with(date, true) { stub }
        currency.last_available_rate_for(date)
      end
    end
  end
end
