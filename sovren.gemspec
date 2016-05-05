# -*- encoding: utf-8 -*-
# stub: sovren 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "sovren"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Fleming"]
  s.date = "2016-05-03"
  s.description = "This is a gem used for parsing resumes using the Sovren resume parser service."
  s.email = ["efleming@gmail.com"]
  s.files = [".gitignore", ".rspec", ".ruby-gemset", ".ruby-version", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "lib/sovren.rb", "lib/sovren/achievement.rb", "lib/sovren/association.rb", "lib/sovren/certification.rb", "lib/sovren/client.rb", "lib/sovren/competency.rb", "lib/sovren/contact_information.rb", "lib/sovren/education.rb", "lib/sovren/employment.rb", "lib/sovren/error.rb", "lib/sovren/language.rb", "lib/sovren/military.rb", "lib/sovren/parse_helpers.rb", "lib/sovren/patent.rb", "lib/sovren/publication.rb", "lib/sovren/reference.rb", "lib/sovren/resume.rb", "lib/sovren/version.rb", "sovren.gemspec", "spec/fixtures/ResumeSample.doc", "spec/fixtures/_resume.xml", "spec/fixtures/achievements.xml", "spec/fixtures/associations.xml", "spec/fixtures/certifications.xml", "spec/fixtures/competencies.xml", "spec/fixtures/competencies_sparse.xml", "spec/fixtures/contact_information.xml", "spec/fixtures/contact_information_sparse.xml", "spec/fixtures/education.xml", "spec/fixtures/education_sparse.xml", "spec/fixtures/employment.xml", "spec/fixtures/employment_sparse.xml", "spec/fixtures/languages.xml", "spec/fixtures/military.xml", "spec/fixtures/patents.xml", "spec/fixtures/publications.xml", "spec/fixtures/references.xml", "spec/fixtures/resume.json", "spec/fixtures/resume.xml", "spec/fixtures/speaking_events.xml", "spec/sovren/achievement_spec.rb", "spec/sovren/association_spec.rb", "spec/sovren/certification_spec.rb", "spec/sovren/client_spec.rb", "spec/sovren/competency_spec.rb", "spec/sovren/contact_information_spec.rb", "spec/sovren/education_spec.rb", "spec/sovren/employment_spec.rb", "spec/sovren/language_spec.rb", "spec/sovren/military_spec.rb", "spec/sovren/patent_spec.rb", "spec/sovren/publication_spec.rb", "spec/sovren/reference_spec.rb", "spec/sovren/resume_spec.rb", "spec/sovren_spec.rb", "spec/spec_helper.rb", "spec/vcr/parsed_resume.yml"]
  s.homepage = "http://github.com/efleming/sovren"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.requirements = ["Access to a sovren resume parser server."]
  s.rubygems_version = "2.4.8"
  s.summary = "This is a gem used for parsing resumes using the Sovren resume parser service."
  s.test_files = ["spec/fixtures/ResumeSample.doc", "spec/fixtures/_resume.xml", "spec/fixtures/achievements.xml", "spec/fixtures/associations.xml", "spec/fixtures/certifications.xml", "spec/fixtures/competencies.xml", "spec/fixtures/competencies_sparse.xml", "spec/fixtures/contact_information.xml", "spec/fixtures/contact_information_sparse.xml", "spec/fixtures/education.xml", "spec/fixtures/education_sparse.xml", "spec/fixtures/employment.xml", "spec/fixtures/employment_sparse.xml", "spec/fixtures/languages.xml", "spec/fixtures/military.xml", "spec/fixtures/patents.xml", "spec/fixtures/publications.xml", "spec/fixtures/references.xml", "spec/fixtures/resume.json", "spec/fixtures/resume.xml", "spec/fixtures/speaking_events.xml", "spec/sovren/achievement_spec.rb", "spec/sovren/association_spec.rb", "spec/sovren/certification_spec.rb", "spec/sovren/client_spec.rb", "spec/sovren/competency_spec.rb", "spec/sovren/contact_information_spec.rb", "spec/sovren/education_spec.rb", "spec/sovren/employment_spec.rb", "spec/sovren/language_spec.rb", "spec/sovren/military_spec.rb", "spec/sovren/patent_spec.rb", "spec/sovren/publication_spec.rb", "spec/sovren/reference_spec.rb", "spec/sovren/resume_spec.rb", "spec/sovren_spec.rb", "spec/spec_helper.rb", "spec/vcr/parsed_resume.yml"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<savon>, ["~> 2.2"])
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.3"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["< 1.10"])
    else
      s.add_dependency(%q<savon>, ["~> 2.2"])
      s.add_dependency(%q<httpclient>, ["~> 2.3"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, ["< 1.10"])
    end
  else
    s.add_dependency(%q<savon>, ["~> 2.2"])
    s.add_dependency(%q<httpclient>, ["~> 2.3"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.4.0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, ["< 1.10"])
  end
end
