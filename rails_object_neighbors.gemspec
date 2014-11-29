$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_object_neighbors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name               = "rails_object_neighbors"
  s.version             = RailsObjectNeighbors::VERSION
  s.summary          = "Neighbors of Object"
  s.description       = "Make possible get neighbors for object your model"
  s.platform           = Gem::Platform::RUBY


  s.author     = "Ancalima Silme"
  s.email       = ["ancalimasilme@gmail.com"]
  s.homepage = "https://rubygems.org/gems/rails_object_neighbors"

  s.files = Dir["{lib}/**/*", "Rakefile", "README.md", "CHANGE.log"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency 'activerecord', '>= 0', '>= 4.0.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
end
