require 'rubygems'
require 'bundler/setup'
require 'httpclient'
require 'vcr'
require 'sovren'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

module FileHelper
  def file_fixture(filename)
    File.read File.join(File.expand_path('../fixtures/', __FILE__), filename)
  end

  def xml_fixture(filename)
    Nokogiri::XML.parse file_fixture(filename)
  end
end

RSpec.configure do |config|
  config.include FileHelper
end
