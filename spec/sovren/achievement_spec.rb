require 'spec_helper'

describe Sovren::Achievement do
  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'achievements.xml' }
      let(:result) { Sovren::Achievement.parse(xml) }

      specify { expect(result.length).to eq(1) }
      specify { expect(result.first.description).to eq("Awarded Medal of Merit by the Royal Society of Forensics, 2005") }
    end

    context "no achievements" do
      let(:result) { Sovren::Achievement.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
