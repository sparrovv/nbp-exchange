#encoding: utf-8
module NbpExchange

  class Currency
    SymbolsNames = {
      'eur' => 'Euro',
      'usd' => 'Dolar amerykański',
      'chf' => 'Frank szwajcarski',
      'gbp' => 'Funt szterling',
      'czk' => 'Korona czeska',
      'jpy' => 'jen (Japonia)'
    }

    attr_reader :symbol
    attr_reader :date

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
      date = date.is_a?(String) ? Date.parse(date) : date
      date = get_valid_date(date) if NbpExchange::Config::get_rate_from_last_working_date
      cn = CurrencyNodes.new(date)
      raw_rate = cn.find(symbol)
      Rate.parse(self, date, raw_rate)
    end

    def get_valid_date(date)
      while is_valid_date?( date ) == false
        date -= 1
      end

      date
    end

    def is_valid_date?( date )
      !date.saturday? && !date.sunday?
    end

  end

end