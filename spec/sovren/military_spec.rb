require 'spec_helper'

describe Sovren::Military do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'military.xml' }
      let(:result) { Sovren::Military.parse(xml) }

      specify { expect(result.country_served).to eq("US") }
      specify { expect(result.branch).to eq("Army") }
      specify { expect(result.rank_achieved).to eq("FIRST LIEUTENANT") }
      specify { expect(result.recognition_achieved).to eq("Purple Heart") }
      specify { expect(result.discharge_status).to eq("Honorable") }
      specify { expect(result.start_date).to eq(Date.new(1966,1,1)) }
      specify { expect(result.end_date).to eq(Date.new(1967,1,1)) }
    end

    context "no military history" do
      let(:result) { Sovren::Military.parse(nil) }

      specify { expect(result).to eq(nil) }
    end
  end
end
