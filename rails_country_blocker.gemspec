$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_country_blocker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_country_blocker"
  s.version     = RailsCountryBlocker::VERSION
  s.authors     = ["Bill Robinson"]
  s.email       = ["bill@robinsonstrategy.com"]
  s.homepage    = "https://github.com/robinsonstrategy/rails_country_blocker"
  s.summary     = "Block entire countries from accessing your site"
  s.description = "An extension which lets you restrict access to controllers at a country-wide level using MaxMind's GeoIP databases."
  s.license     = "BSD"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "maxminddb", "~> 0.1"
end
