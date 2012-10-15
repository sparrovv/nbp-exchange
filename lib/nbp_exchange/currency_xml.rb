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
      list = open('http://nbp.pl/kursy/xml/dir.txt').read
      list.each_line do |item|
        if /a([0-9]+)z#{@date.strftime '%y%m%d'}/.match(item)
          name = @date.strftime '%y' + item[0, 4] + '.xml'
          return name
        end
      end

      raise NoXMLForThisDate
    end

    def xml_url
      XML_URL % {:year => @date.year, :xml_name => xml_name}
    end

    def dir_url
      DIR_URL % {:year => @date.year}
    end
  end

end
