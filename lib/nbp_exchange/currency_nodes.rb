module NbpExchange
  class CurrencyNodes
    def initialize(date)
      @date = date
      @xml = CurrencyXml.new(@date)
    end

    def find(symbol)
      node = nodes.xpath("//pozycja[kod_waluty='#{symbol.upcase}']")
      raise RateNotFound if node.empty?
      node
    end

    def nodes
      @nodes ||= load_nodes
    end

    private

    def load_nodes
      doc = Nokogiri::XML(@xml.open_xml)
      pub_date= doc.xpath('tabela_kursow/data_publikacji').text
      raise InvalidDate unless valid?(pub_date)

      doc.xpath('tabela_kursow/pozycja')
    end

    def valid?(pub_date)
      Date.parse(pub_date) == @date
    end

  end
end
