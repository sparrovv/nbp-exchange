require 'date'
require 'nokogiri'
require 'open-uri'
require 'nbp_exchange/currency'
require 'nbp_exchange/rate'
require 'nbp_exchange/currency_nodes'
require 'nbp_exchange/currency_xml'

module NbpExchange
  class WrongDate < ArgumentError;end
  class NotFoun < RuntimeError;end
end
