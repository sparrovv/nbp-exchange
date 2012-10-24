module NbpExchange
  class RateBuilder
    attr_reader :date, :currency
    def initialize(currency)
      @currency = currency
    end

    def build(date)
      name = name_resolver.find(date)
      raise NoXMLForThisDate unless name
      build_rate(name)
    end

    def build_with_reverse_search(date)
      name = find_last_available_name(date)
      build_rate(name)
    end

    def rate_table(name)
      RateTable.new(name)
    end

    def name_resolver
      @name_resolver ||= FeedNameResolver.new
    end

    private
    def find_last_available_name(d)
      name = name_resolver.find(d)
      unless name
        new_date = d - 1
        find_last_available_name(new_date)
      else
        name
      end
    end

    def build_rate(name)
      rate_table = rate_table(name)
      averate_rate = rate_table.find_average_rate(currency.symbol)
      Rate.new(currency, rate_table.date, averate_rate)
    end
  end
end
