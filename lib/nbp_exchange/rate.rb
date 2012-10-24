module NbpExchange
  class Rate
    attr_reader :currency, :date, :average_exchange_rate

    def initialize(currency, date, average_exchange_rate)
      @date = date
      @currency = currency
      @average_exchange_rate = average_exchange_rate
    end

    def average_exchange_rate
      if @average_exchange_rate.is_a?(String)
        @average_exchange_rate.gsub!(',', '.')
      end
      @average_exchange_rate.to_f
    end
  end
end
