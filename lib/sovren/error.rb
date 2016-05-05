module Sovren
  class Error < StandardError
    def initialize(result)
      super("#{result[:code]}: #{result[:message]}")
    end
  end
end
