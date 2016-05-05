require 'spec_helper'

describe Sovren::Certification do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'certifications.xml' }
      let(:result) { Sovren::Certification.parse(xml) }

      specify { expect(result.length).to eq(4) }
      specify { expect(result[2].name).to eq("Sun Secure Global Desktop (Tarantella) System Administration") }
      specify { expect(result[2].description).to eq("certification") }
      specify { expect(result[2].effective_date).to eq(Date.new(2001,9,1)) }
    end

    context "no competencies" do
      let(:result) { Sovren::Certification.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end

end
