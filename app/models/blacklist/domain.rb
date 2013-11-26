module Blacklist
  class Domain
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :domain, type: String
    validates :domain, presence: true,
      format: { with: /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/ }
  end
end
