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
      @rates = {}
    end

    def name
      @name ||= SymbolsNames[symbol]
    end

    def rate(date)
      @rates[date] ||= load_rate(date)
    end
    alias :rate_at :rate

    def last_available_rate_for(date)
      @rates[date] ||= load_rate(date, true)
    end

    def self.available_currency_keys
      CurrencieNames.keys
    end

    private
    def rate_builder
      @rate_builder ||= RateBuilder.new(self)
    end

    def load_rate(date, reverse_search=false)
      if reverse_search
        rate_builder.build_with_reverse_search(date)
      else
        rate_builder.build(date)
      end
    end
  end
end
