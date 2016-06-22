# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sport_headlines/version'

Gem::Specification.new do |spec|
  spec.name          = "sport_headlines"
  spec.version       = SportHeadlines::VERSION
  spec.authors       = ["cernanb"]
  spec.email         = ["cernanb@gmail.com"]

  spec.summary       = %q{A gem to collate top sport headlines.}
  spec.description   = %q{This gem will scrape the current top headlines of popular sport sites.}
  spec.homepage      = "https://github.com/cernanb/sport-headlines-cli-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  spec.executables   = ["sport_headlines"]
  spec.require_paths = ["lib", "lib/sport_headlines"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency "pry"
end
