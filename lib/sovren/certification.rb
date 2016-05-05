module Sovren
  class Certification
    extend Sovren::ParseHelpers

    attr_accessor :name, :description, :effective_date

    def self.parse(certifications)
      return Array.new if certifications.nil?
      result = certifications.css('LicenseOrCertification').collect do |item|
        c = Certification.new
        c.name = item.css('Name').text
        c.description = item.css('Description').text
        c.effective_date = parse_date item.css('EffectiveDate FirstIssuedDate AnyDate').text
        c
      end
      result
    end

  end
end
