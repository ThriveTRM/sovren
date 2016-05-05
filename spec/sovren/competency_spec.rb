require 'spec_helper'

describe Sovren::Competency do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'competencies.xml' }
      let(:result) { Sovren::Competency.parse(xml) }

      specify { expect(result.length).to eq(50) }
      specify { expect(result.first.name).to eq("MARKETING") }
      specify { expect(result.first.months).to eq(158) }
      specify { expect(result.first.last_used_date).to eq(Date.new(2013,4,29)) }
    end

    context "no competencies" do
      let(:result) { Sovren::Competency.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
