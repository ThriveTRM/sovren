require 'spec_helper'

describe Sovren::Publication do
  let(:publication) { Sovren::Publication.new }

  specify { expect(publication).to respond_to :type }
  specify { expect(publication).to respond_to :title }
  specify { expect(publication).to respond_to :role }
  specify { expect(publication).to respond_to :publication_date }
  specify { expect(publication).to respond_to :journal_or_serial_name }
  specify { expect(publication).to respond_to :volume }
  specify { expect(publication).to respond_to :issue }
  specify { expect(publication).to respond_to :page_number }
  specify { expect(publication).to respond_to :abstract }
  specify { expect(publication).to respond_to :copyright_date }
  specify { expect(publication).to respond_to :copyright_text }
  specify { expect(publication).to respond_to :edition }
  specify { expect(publication).to respond_to :isbn }
  specify { expect(publication).to respond_to :publisher_name }
  specify { expect(publication).to respond_to :publisher_location }
  specify { expect(publication).to respond_to :event_name }
  specify { expect(publication).to respond_to :conference_date }
  specify { expect(publication).to respond_to :conference_location }
  specify { expect(publication).to respond_to :comments }
  specify { expect(publication).to respond_to :number_of_pages }

  describe ".parse" do
    context "a full resume" do
      let(:xml)    { xml_fixture 'publications.xml' }
      let(:result) { Sovren::Publication.parse(xml) }

      specify { expect(result.length).to eq(4) }
      specify { expect(result[0].type).to eq("Article") }
      specify { expect(result[1].type).to eq("Book") }
      specify { expect(result[2].type).to eq("ConferencePaper") }
      specify { expect(result[3].type).to eq("Thesis") }

      specify { expect(result.first.title).to eq("Designing Interfaces for Youth Services Information Management") }
      specify { expect(result.first.role).to eq("author") }
      specify { expect(result.first.publication_date).to eq("1996-06") }
      specify { expect(result.first.journal_or_serial_name).to eq("1996 Human-Computer Interaction Laboratory Video Reports") }
      specify { expect(result.first.volume).to eq("2") }
      specify { expect(result.first.issue).to eq("3") }
      specify { expect(result.first.page_number).to eq("319-329") }
      specify { expect(result[1].abstract).to eq("A very readable introduction to XML.") }
      specify { expect(result[1].copyright_date).to eq("2001") }
      specify { expect(result[1].copyright_text).to eq("Copyright 2nd edition") }
      specify { expect(result[1].edition).to eq("2nd Edition") }
      specify { expect(result[1].isbn).to eq("0596000222") }
      specify { expect(result[1].publisher_name).to eq("O'Malley Associates") }
      specify { expect(result[1].publisher_location).to eq("Garden City, NY, US") }
      specify { expect(result[2].event_name).to eq("SHRM 55th Annual Conference and Exposition") }
      specify { expect(result[2].conference_date).to eq(Date.new(2003,06,10)) }
      specify { expect(result[2].conference_location).to eq("Orlando, FL") }
      specify { expect(result[3].comments).to eq("Ph.D., University of California") }
      specify { expect(result[3].number_of_pages).to eq(158) }
    end

    context "no publications" do
      let(:result) { Sovren::Publication.parse(nil) }

      specify { expect(result).to eq(Array.new) }
    end
  end
end
