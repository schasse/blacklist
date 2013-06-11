require 'blacklist/engine'
require 'blacklist/domain_blacklist_validator'
require 'mongoid'

module Blacklist
end

ActiveModel::Validations.send(:include, Blacklist)
