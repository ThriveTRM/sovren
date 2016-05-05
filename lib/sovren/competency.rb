module Sovren
  class Competency
    extend Sovren::ParseHelpers

    attr_accessor :name, :months, :last_used_date

    def self.parse(competencies)
      return Array.new if competencies.nil?
      results = competencies.css('Competency').collect do |item|
        c = Competency.new
        c.name = item['name']
        c.months = parse_integer item.css('CompetencyEvidence NumericValue').text
        c.last_used_date = parse_date item.css('CompetencyEvidence').first['lastUsed']
        c
      end
      results
    end

  end
end
