# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-socialstudio/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-socialstudio"
  spec.version       = OmniAuth::Socialstudio::VERSION
  spec.authors       = ["Nanda Yadav"]
  spec.email         = ["nandayadav@gmail.com"]

  spec.summary       = %q{OmniAuth Strategy for Socialstudio(part of SalesForce)}
  spec.description   = %q{OmniAuth Strategy for Socialstudio(part of SalesForce)}
  spec.homepage      = "https://github.com/nandayadav/omniauth-socialstudio"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
end
