require 'spec_helper'

describe Sovren::Employment do
  describe ".current_employer?" do
    let(:employment) {Sovren::Employment.new}
    specify { expect(employment.current_employer?).to eq(false) }
  end

  describe ".parse" do
    let(:result) { Sovren::Employment.parse(xml) }

    context "a full resume" do
      let(:xml) { xml_fixture 'employment.xml' }

      specify { expect(result.length).to eq(4) }
      specify { expect(result.first.employer).to eq("Technical Difference") }
      specify { expect(result.first.division).to eq(nil) }
      specify { expect(result.first.title).to eq("Director of Web Applications Development") }
      specify { expect(result.first.city).to eq("Encinitas")}
      specify { expect(result.first.state).to eq("CA")}
      specify { expect(result.first.country).to eq("US")}
      specify { expect(result.first.description.length).to eq(694) }
      specify { expect(result.first.start_date).to eq(Date.new(2004,10,01)) }
      specify { expect(result.first.end_date).to eq(nil) }
      specify { expect(result.first.current_employer).to eq(true) }
      specify { expect(result.first.current_employer?).to eq(true) }
    end

    context "a sparse resume" do
      let(:xml) { xml_fixture 'employment_sparse.xml' }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.employer).to eq("Technical Difference") }
      specify { expect(result.first.title).to eq("Director of Web Applications Development") }
      specify { expect(result.first.current_employer?).to eq(false) }
    end
  end
end
