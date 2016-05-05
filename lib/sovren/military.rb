module Sovren
  class Military
    extend Sovren::ParseHelpers

    attr_accessor :country_served, :branch, :rank_achieved, :recognition_achieved, :discharge_status, :start_date, :end_date

    def self.parse(military_history)
      return nil if military_history.nil?
      e = Military.new
      e.country_served = military_history.css('CountryServed').text
      e.branch = military_history.css('ServiceDetail').first['branch']
      e.rank_achieved = military_history.css('ServiceDetail RankAchieved CurrentOrEndRank').text
      e.recognition_achieved = military_history.css('ServiceDetail RecognitionAchieved').text
      e.discharge_status = military_history.css('ServiceDetail DischargeStatus').text
      e.start_date = parse_date military_history.css('DatesOfService StartDate AnyDate').text
      e.end_date = parse_date military_history.css('DatesOfService EndDate AnyDate').text
      e
    end

  end
end
