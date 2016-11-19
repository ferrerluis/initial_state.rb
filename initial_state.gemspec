Gem::Specification.new do |s|
  s.name        = 'initial_state'
  s.version     = '0.0.1'
  s.date        = '2016-10-12'
  s.summary     = "Ruby Wrapper for InitialState API"
  s.description = "Simple Ruby library for using InitialState API"

  s.authors     = ["Luis Ferrer-Labarca"]
  s.email       = 'gems@ferrerluis.com'

  s.files         = ["lib/initial_state.rb"]
  s.files         += Dir.glob("lib/**/*.rb")

  s.homepage    = 'https://github.com/ferrerluis/initial_state.rb'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.9.3'
  s.add_runtime_dependency 'httparty', '>= 0.14.0'
  s.add_development_dependency "rspec", '>= 3.5.0'
end
