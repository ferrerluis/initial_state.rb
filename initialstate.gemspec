Gem::Specification.new do |s|
  s.name        = 'initialstate'
  s.version     = '0.0.1'
  s.date        = '2016-10-02'
  s.summary     = "Ruby Wrapper for InitialState API"
  s.description = "Simple Ruby library for using InitialState API"
  s.authors     = ["Luis Ferrer-Labarca"]
  s.email       = 'gems@ferrerluis.com'
  s.files       = ["lib/initialstate.rb"]
  s.homepage    =
    'http://rubygems.org/gems/initialstate'
  s.license       = 'MIT'

  s.add_runtime_dependency 'httparty', '>= 0.14.0'
end
