module NbpExchange
  class RateTable
    XML_URL = "http://rss.nbp.pl/kursy/xml2/%{year}/a/%{xml_name}"

    def initialize(name)
      @name = name or fail 'Name is required'
    end

    def find_average_rate(symbol)
      nodes = doc.xpath('tabela_kursow/pozycja')
      node = nodes.xpath("//pozycja[kod_waluty='#{symbol.upcase}']")

      raise RateNotFound if node.empty?

      node.xpath("kurs_sredni").text
    end

    def date
      date_text = doc.xpath('tabela_kursow/data_publikacji').text
      attrs = date_text.split('-').map(&:to_i)
      Date.new(*attrs)
    end

    def content
      @content ||= load_content
    end

    private
    def load_content
      open(xml_url).read
    rescue OpenURI::HTTPError => e
     raise NoXMLForThisDate if e.message == '404 Not Found'
     raise
    end

    def doc
      Nokogiri::XML(content)
    end

    def year
      "20#{@name[0..1]}"
    end

    def xml_url
      XML_URL % {:year => year, :xml_name => @name}
    end
  end
end
