require 'blacklist/engine'
require 'blacklist/domain_blacklist_validator'
require 'mongoid'

module Blacklist
end

ActiveModel::Validations.send(:include, Blacklist)
I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__),
  '../locales', '*.yml')).to_s]
