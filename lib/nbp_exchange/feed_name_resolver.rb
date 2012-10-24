module NbpExchange
  class FeedNameResolver
    NAMES_URL = "http://nbp.pl/kursy/xml/dir.txt"

    def find(date)
      item = nil
      names_list.each_line do |line|
        if line.match /a([0-9]+)z#{date.strftime '%y%m%d'}/
          item = line
        end
      end

      return unless item

      date.strftime '%y' + item[0, 4] + '.xml'
    end

    private
    def names_list
      @names_list ||= open(NAMES_URL).read
    end
  end
end
