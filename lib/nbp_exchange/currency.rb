#encoding: utf-8
module NbpExchange

  class Currency
    CurrencieNames = {
      'eur' => 'Euro',
      'usd' => 'Dolar amerykański'
    }

    attr_reader :symbol

    def initialize(symbol)
      @symbol = symbol.downcase
    end

    def name
      @name ||= CurrencieNames[symbol]
    end

    def rate(date)
      @rate ||= load_rate(date)
    end

    def self.available_currency_keys
      CurrencieNames.keys
    end

    private

    def load_rate(date)
      date = (date.is_a?(String)) ? Date.parse(date) : date
      cn = CurrencyNodes.new(date)
      raw_rate = cn.find(symbol)
      Rate.parse(self, date, raw_rate)
    end
  end

end
