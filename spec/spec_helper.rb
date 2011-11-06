require "rspec"
#require 'fakeweb'
#require 'vcr'
require 'nbp_exchange'
require 'date'

#FakeWeb.allow_net_connect = false

#VCR.config do |c|
  #c.cassette_library_dir     = 'spec/cassettes'
  #c.stub_with                  :fakeweb
  #c.default_cassette_options = { :record => :once }
#end

RSpec.configure do |config|
  #config.extend VCR::RSpec::Macros
end

CURRENCY_SYMBOL = 'eur'
EXCHANGE_DATE = Date.parse("2011-11-02")

