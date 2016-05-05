require 'spec_helper'

describe Sovren::Patent do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'patents.xml' }
      let(:result) { Sovren::Patent.parse(xml) }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.title).to eq("Method and Apparatus for Removing Corn Kernels From Dentures") }
      specify { expect(result.first.description).to eq("George Doam and Neil Griffin, inventors, \"Method and Apparatus for Removing Corn Kernels From Dentures\", Patent 1,064,098.") }
      specify { expect(result.first.inventor_name).to eq("George Doam and Neil Griffin") }
      specify { expect(result.first.patent_id).to eq("1064098") }
    end

    context "no patents" do
      let(:result) { Sovren::Patent.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
