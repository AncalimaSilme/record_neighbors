$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "record_neighbors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform           = Gem::Platform::RUBY
  s.name               = "record_neighbors"
  s.summary          = "Neighbors of ActiveRecord object"
  s.version             = RecordNeighbors::VERSION
  s.description       = <<-EOF
    En: Make possible get neighbors for ActiveRecord object.
    Ru: Позволяет получить следующий/предыдущий объект. Определить первый/последний. А так же несколько других полезных методов.
  EOF

  s.author     = "Ancalima Silme"
  s.email       = ["ancalimasilme@gmail.com"]

  s.files = Dir["{lib}/**/*", "Rakefile", "README.md", "CHANGE.log"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency 'activerecord', '>= 0', '>= 4.0.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
end
