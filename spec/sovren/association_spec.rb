require 'spec_helper'

describe Sovren::Association do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'associations.xml' }
      let(:result) { Sovren::Association.parse(xml) }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.name).to eq("Association of Retired Military Document Examiners") }
      specify { expect(result.first.role).to eq("Member") }
    end

    context "no associations" do
      let(:result) { Sovren::Association.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
