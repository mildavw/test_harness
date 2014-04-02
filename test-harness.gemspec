# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "test-harness"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maher Hawash"]
  s.date = "2014-01-24"
  s.description = "A test harness for rspec and cucumber which allows for separating responsibility between setting up the context and interacting with the browser, and cleaning up the step definition files."
  s.email = "gmhawash@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    ".watchr",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/configuration.rb",
    "lib/given.rb",
    "lib/mental_model.rb",
    "lib/test_harness.rb",
    "lib/test_helper.rb",
    "lib/ui_component.rb",
    "lib/ui_component_helper.rb",
    "lib/ui_driver.rb",
    "lib/ui_helper.rb",
    "lib/ui_view.rb",
    "lib/utilities.rb",
    "spec/fake_harness/given/dandylions/given_test.rb",
    "spec/fake_harness/given/given_test.rb",
    "spec/fake_harness/ui/dandylions/inherited_ui_test.rb",
    "spec/fake_harness/ui/dandylions/ui_test.rb",
    "spec/fake_harness/ui/ui_test.rb",
    "spec/lib/given_spec.rb",
    "spec/lib/test_harness_spec.rb",
    "spec/lib/test_helper_spec.rb",
    "spec/lib/ui_component_helper_spec.rb",
    "spec/lib/utilities_spec.rb",
    "spec/spec_helper.rb",
    "test-harness.gemspec"
  ]
  s.homepage = "http://github.com/gmhawash/test_harness"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Mini test harness for rspec and cucumber"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<test-harness>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<gemcutter>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<test-harness>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<gemcutter>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<test-harness>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<gemcutter>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

