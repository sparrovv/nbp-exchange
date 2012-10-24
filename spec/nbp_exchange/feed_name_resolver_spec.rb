require 'spec_helper'

module NbpExchange
  describe FeedNameResolver do
    let(:resolver) { FeedNameResolver.new }

    describe '#find' do
      context 'when document available' do
        let(:date) { Date.new(2012,9,4) }

        it 'returns name of the xml document for given date' do
          resolver.find(date).should == '12a171.xml'
        end
      end

      context 'when document is not available, because it\'s saturday' do
        let(:date) { Date.new(2012,9,1) }

        it 'returns nil' do
          resolver.find(date).should be_nil
        end
      end
    end

  end
end
