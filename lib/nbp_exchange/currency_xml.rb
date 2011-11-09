module NbpExchange

  class CurrencyXml
    DIR_URL = "http://rss.nbp.pl/kursy/xml2/%{year}/a/dir.aspx"
    XML_URL = "http://rss.nbp.pl/kursy/xml2/%{year}/a/%{xml_name}"

    def initialize(date)
      @date = date
    end

    def open_xml
      page = open(xml_url)
      page.read
    end

    def xml_name
      page = open(dir_url)
      doc = Nokogiri::HTML(page.read)

      date_row = doc.text[/^#{@date.to_s}.+/]
      name = date_row ? date_row[/(\w+.xml)/, 1] : nil

      raise NoXMLForThisDate if name.nil? || name.empty?
      name
    end

    def xml_url
      XML_URL % {:year => @date.year, :xml_name => xml_name}
    end

    def dir_url
      DIR_URL % {:year => @date.year}
    end
  end

end
