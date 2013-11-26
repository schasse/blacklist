$:.push File.expand_path('../lib', __FILE__)

require 'blacklist/version'

Gem::Specification.new do |s|
  s.name        = 'blacklist'
  s.version     = Blacklist::VERSION
  s.authors     = ['schasse']
  s.email       = ['sebastian.schasse@gapfish.com']
  s.homepage    = 'http://github.com/schasse/blacklist'
  s.summary     = 'Blacklist some domains p.e. for your email validation.'
  s.description = 'Blacklist some domains p.e. for your email validation.'

  s.files = Dir['{app,lib}/**/*'] +
    ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails'
  s.add_dependency 'mongoid', '>= 3'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'travis'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'appraisal'

  if ENV['RUBY_VERSION'] =~ /rbx/
    s.add_dependency 'rubysl'
    s.add_development_dependency 'rubinius-coverage'
  end

  if ENV['RUBY_VERSION'] =~ /jruby/
    s.add_dependency 'jdbc-sqlite3'
  else
    s.add_dependency 'sqlite3'
  end
end
