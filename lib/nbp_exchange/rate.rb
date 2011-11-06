module NbpExchange

  class Rate

    attr_reader :currency
    attr_reader :date
    attr_reader :average_exchange_rate

    def initialize(currency, date, aer)
      @date = date
      @currency = currency
      @average_exchange_rate = aer
    end

    def self.parse(currency, date, raw)
      aer = raw.xpath("kurs_sredni").text
      aer = aer.gsub(',','.').to_f
      Rate.new(currency, date, aer)
    end

  end
end
