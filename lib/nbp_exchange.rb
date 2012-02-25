require 'date'
require 'nokogiri'
require 'open-uri'
require 'nbp_exchange/currency'
require 'nbp_exchange/rate'
require 'nbp_exchange/currency_nodes'
require 'nbp_exchange/currency_xml'

module NbpExchange
  GetRateFromLastWorkingDay = false

  class InvalidDate < ArgumentError;end
  class RateNotFound < RuntimeError;end
  class NoXMLForThisDate < RuntimeError;end
end
