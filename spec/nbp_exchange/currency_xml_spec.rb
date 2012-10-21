require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe CurrencyXml do

    let(:xml){ CurrencyXml.new(EXCHANGE_DATE)}
    let(:file_path) { File.expand_path('../../fixtures/xml_names_list.txt', __FILE__) }
    let(:xml_names_list) { File.read(file_path) }

    before do
      xml.stub(:xml_names_list) { xml_names_list }
    end

    describe "#xml_name" do
      context "when date is #{EXCHANGE_DATE}" do
        it "should return proper name for the date" do
          xml.xml_name.should == "11a212.xml"
        end
      end

      context "when there is no xml for that date" do
        before do
          date = Date.new(2012,9,1)
          xml.date = date
        end

        it "should return proper name for the date" do
          expect do
            xml.xml_name.should
          end.to raise_error(NoXMLForThisDate)
        end
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
