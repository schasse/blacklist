class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  validates :email, domain_blacklist: true
end
