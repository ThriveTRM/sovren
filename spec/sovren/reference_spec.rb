require 'spec_helper'

describe Sovren::Reference do
  let(:reference) { Sovren::Reference.new }

  specify { expect(reference).to respond_to :name }
  specify { expect(reference).to respond_to :title }
  specify { expect(reference).to respond_to :email }
  specify { expect(reference).to respond_to :phone_number }

  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'references.xml' }
      let(:result) { Sovren::Reference.parse(xml) }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.name).to eq("Babs Smith") }
      specify { expect(result.first.title).to eq("Manager") }
      specify { expect(result.first.email).to eq("babs@somers.com") }
      specify { expect(result.first.phone_number).to eq("845-876-0988") }
    end

    context "no references" do
      let(:result) { Sovren::Reference.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
