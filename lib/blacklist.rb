require 'blacklist/engine'
require 'blacklist/domain_blacklist_validator'

module Blacklist
end

ActiveModel::Validations.send(:include, Blacklist)
