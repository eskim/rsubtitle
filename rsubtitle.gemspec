# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'rsubtitle/version'
 
Gem::Specification.new do |s|
  s.name        = "rsubtitle"
  s.version     = Rsubtitle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eunsub Kim"]
  s.email       = ["eunsub@gmail.com"]
  s.homepage    = "http://github.com/eskim/rsubtitle"
  s.summary     = "Ruby video subtitle parser and formatter"
  s.description = "Ruby video subtitle parser and formatter"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rsubtitle"
 
#   s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(README.md)
#   s.executables  = ['rsubtitle']
  s.require_path = 'lib'
end
