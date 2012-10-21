module NbpExchange

  class CurrencyXml
    DIR_URL = "http://nbp.pl/kursy/xml/dir.txt"
    XML_URL = "http://rss.nbp.pl/kursy/xml2/%{year}/a/%{xml_name}"

    attr_accessor :date
    def initialize(date)
      @date = date
    end

    def open_xml
      open(xml_url).read
    end

    def xml_name
      item = nil
      xml_names_list.each_line do |line|
        if line.match /a([0-9]+)z#{@date.strftime '%y%m%d'}/
          item = line
        end
      end
      raise NoXMLForThisDate unless item

      @date.strftime '%y' + item[0, 4] + '.xml'
    end

    def xml_names_list
      @xml_names_list ||= open(DIR_URL).read
    end

    def xml_url
      XML_URL % {:year => @date.year, :xml_name => xml_name}
    end
  end
end
