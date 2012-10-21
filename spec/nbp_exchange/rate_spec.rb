require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange

  describe Rate do
    let(:currency){ Currency.new(CURRENCY_SYMBOL) }
    let(:rate){ Rate.new(currency, EXCHANGE_DATE, 12) }

    describe ".parse" do
      it "should parse rate from xml object" do

      end
    end
  end
end
