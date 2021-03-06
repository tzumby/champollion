$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "champollion/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "champollion"
  s.version     = Champollion::VERSION
  s.authors     = ["Razvan"]
  s.email       = ["tzumby@gmail.com"]
  s.homepage    = "http://github.com/tzumby/champollion"
  s.summary     = "Champollion is a Rails engine that allows storing I18n translation in a database."
  s.description = "Rails engine for I18n translations"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.require_paths = %w(lib)

  s.add_runtime_dependency 'rails', '~> 4.2', '>= 4.2.1'
  s.add_runtime_dependency 'paper_trail', '~> 4.0.0.beta'
  s.add_runtime_dependency 'bootstrap_form', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency "sqlite3", "~> 1.3", '>= 1.3.1'
  s.add_development_dependency 'rspec-rails', "~> 3.2", '>= 3.2.0'
  s.add_development_dependency 'capybara', "~> 2.4", '>= 2.4.1'
  s.add_development_dependency 'factory_girl_rails', "~> 4.5", '>= 4.5.0'
  s.add_development_dependency 'generator_spec', "~> 0.9", ">= 0.9.3"
  s.add_development_dependency 'codeclimate-test-reporter', "~> 0.4", ">= 0.4.7"
end
