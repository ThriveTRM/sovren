require 'spec_helper'

describe Sovren::Resume do
  let(:resume) { Sovren::Resume.new }

  specify { expect(resume).to respond_to :executive_summary }
  specify { expect(resume).to respond_to :objective }
  specify { expect(resume).to respond_to :contact_information }
  specify { expect(resume).to respond_to :education_history }
  specify { expect(resume).to respond_to :employment_history }
  specify { expect(resume).to respond_to :competencies }
  specify { expect(resume).to respond_to :achievements }
  specify { expect(resume).to respond_to :associations }
  specify { expect(resume).to respond_to :certifications }
  specify { expect(resume).to respond_to :languages }
  specify { expect(resume).to respond_to :military_history }
  specify { expect(resume).to respond_to :patent_history }
  specify { expect(resume).to respond_to :publication_history }
  specify { expect(resume).to respond_to :references }

  describe '.parse' do
    let(:raw_xml) { file_fixture 'resume.xml' }
    let(:result) { Sovren::Resume.parse(raw_xml) }

    specify { expect(result.executive_summary.length).to eq(119) }
    specify { expect(result.objective.length).to eq(84) }
    specify { expect(result.contact_information).not_to be_nil }
    specify { expect(result.education_history.length).to eq(2) }
    specify { expect(result.employment_history.length).to eq(4) }
    specify { expect(result.competencies.length).to eq(54) }
    specify { expect(result.achievements.length).to eq(1) }
    specify { expect(result.associations.length).to eq(1) }
    specify { expect(result.certifications.length).to eq(4) }
    specify { expect(result.languages.length).to eq(3) }
    specify { expect(result.military_history.class).to eq(Sovren::Military) }
    specify { expect(result.patent_history.length).to eq(1) }
    specify { expect(result.publication_history.length).to eq(4) }
    specify { expect(result.references.length).to eq(1) }
  end
end
