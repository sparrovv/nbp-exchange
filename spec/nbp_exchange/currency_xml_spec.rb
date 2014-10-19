require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module NbpExchange
  describe CurrencyXml do

    let(:xml){ CurrencyXml.new(EXCHANGE_DATE)}
    let(:file_path) { File.expand_path('../../fixtures/xml_names_list.txt', __FILE__) }
    let(:xml_names_list) { File.read(file_path) }

    before do
      expect(xml).to receive(:xml_names_list).and_return(xml_names_list)
    end

    describe "#xml_name" do
      context "when date is #{EXCHANGE_DATE}" do
        it "should return proper name for the date" do
          expect(xml.xml_name).to eq "11a212.xml"
        end
      end

      context "when there is no xml for that date" do
        it 'raises exception' do
          xml.date = Date.new(2012,9,1)

          expect { xml.xml_name }.to raise_error(NoXMLForThisDate)
        end
      end
    end

    describe "open_xml" do
      it "should return tabla_kursow" do
        file = xml.open_xml
        expect(file[/tabela_kursow/i]).to eq "tabela_kursow"
      end
    end
  end
end
