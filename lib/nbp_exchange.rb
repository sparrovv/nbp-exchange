require 'date'
require 'nokogiri'
require 'open-uri'
require 'nbp_exchange/currency'
require 'nbp_exchange/rate'
require 'nbp_exchange/rate_builder'
require 'nbp_exchange/feed_name_resolver'
require 'nbp_exchange/rate_table'

module NbpExchange
  class InvalidDate < ArgumentError;end
  class RateNotFound < RuntimeError;end
  class NoXMLForThisDate < RuntimeError;end
end
