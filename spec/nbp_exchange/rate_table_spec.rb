require 'spec_helper'

module NbpExchange
  describe RateTable do
    let(:rate_table) { RateTable.new(file_name)}
    let(:file_name) { '12a171.xml' }

    describe '#find_average_rate' do
      context 'symbol exists' do
        let(:symbol) { 'usd' }

        it 'finds average rate' do
          rate_table.find_average_rate(symbol).should == '3,3281'
        end
      end

      context 'symbol does\'t exist' do
        let(:symbol) { 'foo' }

        it 'raises error' do
          expect do
            rate_table.find_average_rate(symbol)
          end.to raise_error
        end
      end
    end

    describe '#date' do
      it 'returns content date' do
        rate_table.date.should == Date.new(2012, 9, 4)
      end
    end

    describe '#content' do
      context 'when name exists' do
        it 'returns content of the rate table for given name' do
          rate_table.content.should include 'tabela_kursow'
        end
      end

      context 'when not found' do
        let(:file_name) { '12gd171.xml' }
        it 'returns content of the rate table for given name' do
          expect do
            rate_table.content
          end.to raise_error(NoXMLForThisDate)
        end
      end
    end

  end
end
