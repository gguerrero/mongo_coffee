$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongo_coffee/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongo_coffee"
  s.version     = MongoCoffee::VERSION
  s.authors     = ["Guillermo Guerrero"]
  s.email       = ["g.guerrero.bus@gmail.com"]
  s.homepage    = "https://github.com/gguerrero/mongo_coffee#mongocoffee"
  s.summary     = "MongoDB mapReduce with coffeescript."
  s.description = "Map reduce your mongo documents writing in with coffeescript."

  s.files = `git ls-files`.split("\n")

  s.add_dependency "rails", ">= 3.2.14"
  s.add_dependency "coffee-script", "~> 2.2.0"
  s.add_dependency "mongoid", ">= 3.1.0"
end
