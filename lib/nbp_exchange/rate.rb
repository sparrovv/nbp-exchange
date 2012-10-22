module NbpExchange
  class Rate
    attr_reader :currency
    attr_reader :date
    attr_reader :average_exchange_rate

    def initialize(currency, date, average_exchange_rate)
      @date = date
      @currency = currency
      @average_exchange_rate = average_exchange_rate
    end

    def self.build(currency, date)
      cn = CurrencyNodes.new(date)
      raw_rate = cn.find(currency.symbol)

      average_rate = raw_rate.
        xpath("kurs_sredni").text.gsub(',','.').to_f

      Rate.new(currency, date, average_rate)
    end

  end
end
