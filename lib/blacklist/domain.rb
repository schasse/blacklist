module Blacklist
  class Domain
    include Mongoid::Document
    include Mongoid::Timestamps

    field :domain, type: String
    validates :domain, presence: true
  end
end
