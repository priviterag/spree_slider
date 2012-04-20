# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_slider'
  s.version     = '1.0.1'
  s.summary     = 'Spree Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Giuseppe Privitera'
  s.email             = 'priviterag@gmail.com'
  s.homepage          = 'https://github.com/priviterag/spree_slider'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.0.beta'

  #  s.add_development_dependency 'capybara', '1.0.1'
  #  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  #  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end