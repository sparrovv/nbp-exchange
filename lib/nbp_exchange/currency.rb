#encoding: utf-8
module NbpExchange
  class Currency
    SymbolsNames = {
      'eur' => 'Euro',
      'usd' => 'Dolar amerykański',
      'chf' => 'Frank szwajcarski',
      'gbp' => 'Funt szterling',
      'czk' => 'Korona czeska',
      'jpy' => 'Jen (Japonia)'
    }

    attr_reader :symbol

    def initialize(symbol)
      @symbol = symbol.downcase
    end

    def name
      @name ||= SymbolsNames[symbol]
    end

    def rate(date)
      @rate = load_rate(date)
    end

    def self.available_currency_keys
      CurrencieNames.keys
    end

    private

    def load_rate(date)
      date = (date.is_a?(String)) ? Date.parse(date) : date
      Rate.build(self, date)
    end
  end
end
