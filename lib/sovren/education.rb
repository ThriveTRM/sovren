module Sovren
  class Education
    extend Sovren::ParseHelpers

    attr_accessor :school_name, :city, :state, :country, :degree_name, :degree_type, :major, :minor, :gpa, :gpa_out_of, :start_date, :end_date, :graduated

    def self.parse(education_history)
      return Array.new if education_history.nil?
      result = education_history.css('SchoolOrInstitution').map do |item|
        e = Education.new
        e.school_name = item.css('SchoolName').text
        e.city = item.css('PostalAddress Municipality').text
        e.state = item.css('PostalAddress Region').text
        e.country = item.css('PostalAddress CountryCode').text
        e.degree_type = item.css('Degree').first['degreeType']
        e.degree_name = item.css('Degree DegreeName').text
        e.major = item.css('DegreeMajor Name').text
        e.minor = item.css('DegreeMinor name').text
        e.gpa = parse_float item.css('EducationalMeasure MeasureValue StringValue').text
        e.gpa_out_of = parse_float item.css('EducationalMeasure HighestPossibleValue StringValue').text
        e.start_date = parse_date item.css('DatesOfAttendance StartDate AnyDate').text
        e.end_date = parse_date item.css('DatesOfAttendance EndDate AnyDate').text
        e.graduated = item.css('Degree DegreeDate AnyDate').text != ""
        e
      end
      result
    end

    def graduated?
      !graduated.nil? && graduated
    end
  end
end
