require 'bundler/setup'
require 'sovren/version'
require 'savon'
require 'httpclient'
require 'nokogiri'
require 'sovren/parse_helpers'
require 'sovren/achievement'
require 'sovren/association'
require 'sovren/certification'
require 'sovren/client'
require 'sovren/competency'
require 'sovren/contact_information'
require 'sovren/education'
require 'sovren/employment'
require 'sovren/error'
require 'sovren/language'
require 'sovren/military'
require 'sovren/patent'
require 'sovren/publication'
require 'sovren/reference'
require 'sovren/resume'

module Sovren
  class << self
    attr_accessor :endpoint
    attr_accessor :username
    attr_accessor :password
    attr_accessor :timeout
    attr_accessor :hard_time_out_multiplier
    attr_accessor :parser_configuration_params

    def configure
      yield self
      true
    end
  end
end
