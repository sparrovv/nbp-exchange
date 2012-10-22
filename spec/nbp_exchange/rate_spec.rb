require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange

  describe Rate do
    let(:currency){ Currency.new(CURRENCY_SYMBOL) }
    let(:rate){ Rate.new(currency, EXCHANGE_DATE, 12) }
    let(:file_path){ File.expand_path '../../12a204.xml'}
    let(:raw_xml){ File.read(file_path) }

    it 'has date' do
      rate.date.should == EXCHANGE_DATE
    end

    it 'has currency' do
      rate.currency.should == currency
    end

    it 'has average_exchange_rate' do
      rate.average_exchange_rate.should == 12
    end

    describe ".build" do
      it "creates rate from given currency and date" do

      end
    end
  end
end
