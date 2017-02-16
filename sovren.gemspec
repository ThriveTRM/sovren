lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sovren/version'

Gem::Specification.new do |s|
  s.name = 'sovren'
  s.version = Sovren::VERSION

  s.authors = ['Ray Zane']
  s.description = 'This is a gem used for parsing resumes using the Sovren resume parser service.'
  s.email = ['ray@promptworks.com']
  s.homepage = 'http://github.com/promptworks/sovren'
  s.licenses = ['MIT']
  s.rubygems_version = '2.4.8'
  s.summary = 'This is a gem used for parsing resumes using the Sovren resume parser service.'

  s.require_paths = ['lib']
  s.files         = `git ls-files`.split
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'savon', '~> 2.2'
  s.add_dependency 'httpclient', '~> 2.3'
  s.add_dependency 'nokogiri'
  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake', '>= 0'
  s.add_development_dependency 'pry', '>= 0'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'vcr', '>= 0'
  s.add_development_dependency 'webmock', '~> 1.9.3'
end
