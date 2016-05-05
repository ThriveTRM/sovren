module Sovren
  module ParseHelpers
    private

    def parse_float(value)
      Float(value) rescue nil
    end

    def parse_integer(value)
      Integer(value) rescue nil
    end

    def parse_date(value)
      Date.parse(value) rescue nil
    end
  end
end
