module Sovren
  class Employment
    extend Sovren::ParseHelpers

    attr_accessor :employer, :division, :city, :state, :country, :title, :description, :start_date, :end_date, :current_employer

    def self.parse(employment_history)
      return Array.new if employment_history.nil?

      employment_history.css('EmployerOrg').flat_map do |item|
        item.css('PositionHistory').map do |position|
          e = Employment.new
          e.employer = item.css('EmployerOrgName').text
          e.division = position.css('OrganizationName').text
          e.division = nil if e.employer == e.division
          e.city = item.css('PositionLocation Municipality').text
          e.state = item.css('PositionLocation Region').text
          e.country = item.css('PositionLocation CountryCode').text
          e.title = position.css('Title').text
          e.description = position.css('Description').text
          e.start_date = parse_date position.css('StartDate').text
          e.current_employer = position['currentEmployer'] == "true"
          e.end_date = e.current_employer ? nil : parse_date(position.css('EndDate').text)
          e
        end
      end
    end

    def current_employer?
      !current_employer.nil? && current_employer
    end

  end
end
