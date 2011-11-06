# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nbp_exchange/version"

Gem::Specification.new do |s|
  s.name        = "nbp_exchange"
  s.version     = NbpExchange::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michal Wrobel"]
  s.email       = ["sparrovv@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Get averange exchange rate for PLN zloty, with specific date}
  s.description = %q{This is wrapper to NBP exchange rates}

  s.rubyforge_project = "nbp_exchange"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('nokogiri')

  s.add_development_dependency('rspec')
  s.add_development_dependency('vcr')
  s.add_development_dependency('fakeweb')
end
