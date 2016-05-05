require 'spec_helper'

describe Sovren::Language do
  describe ".parse" do
    context "a full resume" do
      let(:xml) { xml_fixture 'languages.xml' }
      let(:result) { Sovren::Language.parse(xml) }

      specify { expect(result.length).to eq(3) }
      specify { expect(result.first.language_code).to eq("ps") }
      specify { expect(result.first.read?).to eq(true) }
      specify { expect(result.first.speak?).to eq(true) }
      specify { expect(result.first.write?).to eq(true) }
    end

    context "no languages" do
      let(:result) { Sovren::Language.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
