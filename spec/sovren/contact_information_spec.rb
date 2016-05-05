require 'spec_helper'

describe Sovren::ContactInformation do
  let(:contact_information) { Sovren::ContactInformation.new }

  specify { expect(contact_information).to respond_to :first_name }
  specify { expect(contact_information).to respond_to :middle_name }
  specify { expect(contact_information).to respond_to :last_name }
  specify { expect(contact_information).to respond_to :generation }

  specify { expect(contact_information).to respond_to :address_line_1 }
  specify { expect(contact_information).to respond_to :address_line_2 }
  specify { expect(contact_information).to respond_to :city }
  specify { expect(contact_information).to respond_to :state }
  specify { expect(contact_information).to respond_to :country }
  specify { expect(contact_information).to respond_to :postal_code }

  specify { expect(contact_information).to respond_to :home_phone }
  specify { expect(contact_information).to respond_to :mobile_phone }

  specify { expect(contact_information).to respond_to :email }
  specify { expect(contact_information).to respond_to :website }

  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'contact_information.xml' }
      let(:result) { Sovren::ContactInformation.parse(xml) }

      specify { expect(result.first_name).to eq("John") }
      specify { expect(result.middle_name).to eq("F.") }
      specify { expect(result.last_name).to eq("Adams") }
      specify { expect(result.generation).to eq("III") }
      specify { expect(result.aristocratic_title).to eq("Duke") }
      specify { expect(result.form_of_address).to eq("Mr.") }
      specify { expect(result.qualification).to eq("M.D.") }

      specify { expect(result.address_line_1).to eq("930 Via Mil Cumbres") }
      specify { expect(result.address_line_2).to eq("Unit 119") }
      specify { expect(result.city).to eq("Solana Beach") }
      specify { expect(result.state).to eq("CA") }
      specify { expect(result.postal_code).to eq("92075") }
      specify { expect(result.country).to eq("US") }

      specify { expect(result.home_phone).to eq("(858) 555-1000") }
      specify { expect(result.mobile_phone).to eq("(858) 555-1001") }

      specify { expect(result.website).to eq("http://www.linkedin.com/in/johnadams") }
      specify { expect(result.email).to eq("johnadams@yamoo.com") }
    end

    context "a sparse resume" do
      let(:xml)    { xml_fixture 'contact_information_sparse.xml' }
      let(:result) { Sovren::ContactInformation.parse(xml) }

      specify { expect(result.first_name).to eq("John") }
      specify { expect(result.last_name).to eq("Adams") }
      specify { expect(result.email).to eq("johnadams@yamoo.com") }
    end

    context "no contact info" do
      let(:result) { Sovren::ContactInformation.parse(nil) }

      specify { expect(result).to eq(nil) }
    end
  end
end
