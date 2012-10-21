require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe CurrencyXml do

    let(:xml){ CurrencyXml.new(EXCHANGE_DATE)}

    describe "#xml_name" do
      it "should return proper name for the date" do
        xml.xml_name.should == "11a212.xml"
      end
    end

    describe "open_xml" do
      it "should return tabla_kursow" do
        file = xml.open_xml
        file[/tabela_kursow/i].should == "tabela_kursow"
      end
    end
  end
end
