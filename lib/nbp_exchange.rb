require 'date'
require 'nokogiri'
require 'open-uri'
require 'nbp_exchange/currency'
require 'nbp_exchange/rate'
require 'nbp_exchange/currency_nodes'
require 'nbp_exchange/currency_xml'

module NbpExchange
  module Config
  	extend self

  	def get_rate_from_last_working_date
  		@get_rate_from_last_working_date || false
  	end

  	def get_rate_from_last_working_date=(v)
  		@get_rate_from_last_working_date = v
  	end
  end

  class InvalidDate < ArgumentError;end
  class RateNotFound < RuntimeError;end
  class NoXMLForThisDate < RuntimeError;end
end
