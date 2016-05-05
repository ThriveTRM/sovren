require 'spec_helper'

describe Sovren::Education do
  describe ".graduated?" do
    let(:education) {Sovren::Education.new}
    specify { expect(education.graduated?).to eq(false) }
  end

  describe ".parse" do
    let(:result) { Sovren::Education.parse(xml) }

    context "a full list of experience" do
      let(:xml) { xml_fixture 'education.xml' }

      specify { expect(result.length).to eq(2) }
      specify { expect(result.first.school_name).to eq("California State University") }
      specify { expect(result.first.city).to eq("Chico")}
      specify { expect(result.first.state).to eq("CA")}
      specify { expect(result.first.country).to eq("US")}
      specify { expect(result.first.major).to eq("Business Administration") }
      specify { expect(result.first.minor).to eq("") }
      specify { expect(result.first.degree_type).to eq("bachelors") }
      specify { expect(result.first.degree_name).to eq("B.S.") }
      specify { expect(result.first.gpa).to eq(3.66) }
      specify { expect(result.first.gpa_out_of).to eq(4.00) }
      specify { expect(result.first.start_date).to eq(Date.new(1996,1,1)) }
      specify { expect(result.first.end_date).to eq(Date.new(1999,1,1)) }
      specify { expect(result.first.graduated).to eq(true) }
      specify { expect(result.first.graduated?).to eq(true) }
    end

    context "very little experience information" do
      let(:xml) { xml_fixture 'education_sparse.xml' }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.school_name).to eq("California State University") }
      specify { expect(result.first.degree_type).to eq("bachelors") }
      specify { expect(result.first.degree_name).to eq("B.S.") }
      specify { expect(result.first.gpa).to eq(nil) }
    end
  end
end
