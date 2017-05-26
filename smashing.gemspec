# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'smashing'
  s.version     = '1.0.0'
  s.date        = '2016-10-23'
  s.executables = %w(smashing)


  s.summary     = "The wonderfully excellent dashboard framework."
  s.description = "A framework for pulling together an overview of data that is important to your team and displaying it easily on TVs around the office. You write a bit of ruby code to gather data from some services and let Smashing handle the rest - displaying that data in a wonderfully simple layout. Built for developers and hackers, Smashing is highly customizable while maintaining humble roots that make it approachable to beginners."
  s.author      = "Daniel Beauchamp"
  s.homepage    = 'http://smashing.github.io/smashing'
  s.license     = "MIT"

  s.files = Dir['README.md', 'javascripts/**/*', 'templates/**/*','templates/**/.[a-z]*', 'lib/**/*']

  s.add_dependency('sass', '~> 3.2.12')
  s.add_dependency('coffee-script', '~> 2.2.0')
  s.add_dependency('execjs', '~> 2.0.2')
  s.add_dependency('sinatra', '~> 1.4.4')
  s.add_dependency('sinatra-contrib', '~> 1.4.2')
  s.add_dependency('thin', '~> 1.6.1')
  s.add_dependency('rufus-scheduler', '~> 3.2.0')
  s.add_dependency('thor', '~> 0.19')
  s.add_dependency('sprockets', '~> 2.10.1')
  s.add_dependency('rack', '~> 1.5.4')

  s.add_development_dependency('rake', '~> 10.1.0')
  s.add_development_dependency('haml', '~> 4.0.4')
  s.add_development_dependency('minitest', '~> 5.2.0')
  s.add_development_dependency('mocha', '~> 0.14.0')
  s.add_development_dependency('fakeweb', '~> 1.3.0')
  s.add_development_dependency('simplecov', '~> 0.8.2')
end
