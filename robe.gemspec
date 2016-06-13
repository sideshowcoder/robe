# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "robe"
  spec.version       = "0.7.9"
  spec.authors       = ["Phil Hagelberg, Dmitry Gutov"]
  spec.description   = %q{Gem packaged ruby backend support for emacs robe-mode}
  spec.summary       = %q{Robe is a code assistance tool that uses a Ruby REPL subprocess with your application 
or gem code loaded, to provide information about loaded classes and modules, and where each method is defined. 
This is the ruby backend packaged as a ruby gem}
  spec.homepage      = "https://github.com/dgutov/robe"
  spec.license       = "GPL"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
