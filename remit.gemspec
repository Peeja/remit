# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remit/version'

Gem::Specification.new do |spec|
  spec.name             = "remit"
  spec.version          = Remit::VERSION
  spec.authors          = ["Tyler Hunt", "Peter Boling"]
  spec.email            = "peter.boling+remit@gmail.com"
  spec.summary          = %q{An API for using the Amazon Flexible Payment Service (FPS).}
  spec.description      = %q{An API for using the Amazon Flexible Payment Service (FPS).}
  spec.homepage         = %q{http://github.com/nyc-ruby-meetup/remit}
  spec.license          = "MIT"

  spec.files            = Dir['{bin,lib}/**/*']
  spec.executables      = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files       = Dir['{spec}/**/{*spec.rb,*helper.rb,*.xml}']
  spec.require_paths    = ["lib"]
  spec.extra_rdoc_files = ["LICENSE", "README.markdown"]

  spec.add_runtime_dependency("relax", "~> 0.0.7")

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 1.0"
  spec.add_development_dependency "dotenv"
end

