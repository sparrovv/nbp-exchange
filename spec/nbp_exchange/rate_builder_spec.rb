require 'spec_helper'

module NbpExchange
  describe RateBuilder do
    let(:feed_name_resolver_spec) { FeedNameResolver.new }
    let(:rate_table) { RateTable.new(name) }

    let(:currency) { stub('Currency', :symbol => 'Usd') }
    let(:date) { Date.new(2012, 9, 4) }
    let(:rate_builder) { RateBuilder.new(currency) }

    describe 'build' do
      context 'when there is a rate for given date and currency' do
        it 'creates rate object' do
          rate = rate_builder.build(date)
          rate.should be_an_instance_of Rate
          rate.currency.should == currency
          rate.date.should == date
        end
      end

      context 'when tere is no rate for given date' do
        before do
          rate_builder.name_resolver.stub(:find).and_return(nil)
        end

        it 'expects error' do
          expect do
            rate = rate_builder.build(date)
          end.to raise_error(NoXMLForThisDate)
        end
      end
    end

    describe '#build_with_reverse search' do
      let(:rt) { stub('RateTable', :date => Date.new(2011,12,1), :find_average_rate => '1.2') }

      before do
        rate_builder.name_resolver.stub(:find).with(date).and_return(nil)
        rate_builder.name_resolver.stub(:find).with(date - 1).and_return('name')
        stub_rate_table('name', rt)
      end

      context 'when there is no name for given date' do
        it 'looks for a name one date earlier' do
          rate = rate_builder.build_with_reverse_search(date)
          rate.date.should == rt.date
          rate.average_exchange_rate.should == rt.find_average_rate.to_f
        end
      end
    end

    it 'has feed_name_resolver that can resolve date to name' do
      rate_builder.name_resolver.should respond_to(:find)
    end

    private
    def stub_rate_table(name, rt)
      rate_builder.stub(:rate_table).with(name) { rt }
    end
  end
end
