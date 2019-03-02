# -*- encoding: utf-8 -*-
require File.expand_path('../lib/whiplash/batches/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_runtime_dependency 'mechanize', '~> 2.7'
  

  # gem.add_development_dependency 'rspec', '~> 2.7'
  # gem.add_development_dependency 'rack-test'
  # gem.add_development_dependency 'webmock'
  # gem.add_development_dependency 'simplecov'

  gem.authors       = ["Waqas Ali"]
  gem.email         = ["wqsaali@gmail.com"]
  gem.description   = %q{Enable Whiplash batches api with email/password}
  gem.summary       = %q{Enable Whiplash batches api with emai/password}
  gem.homepage      = "https://github.com/wqsaali/whiplash-batches-api"
  gem.license       = "GPL-3.0"

  gem.files         = `git ls-files`.split("\n")
  # gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "whiplash-batches-api"
  gem.require_paths = ["lib"]
  gem.version       = Whiplash::Batches::VERSION
end
