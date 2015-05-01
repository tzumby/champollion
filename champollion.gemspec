$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "champollion/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "champollion"
  s.version     = Champollion::VERSION
  s.authors     = ["Razvan"]
  s.email       = ["tzumby@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Champollion."
  s.description = "TODO: Description of Champollion."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "i18n-active_record"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

end
