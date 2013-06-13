require 'spec_helper'

describe Blacklist::DomainBlacklistValidator do
  before do
    @validator = Blacklist::DomainBlacklistValidator.new({ attributes: {} })
  end

  describe '#blacklisted?(string)' do
    before do
      @domains = []
      @domains << Blacklist::Domain.new(domain: 'blacklisted.com')
      @domains << Blacklist::Domain.new(domain: 'junk.de')
      Blacklist::Domain.stub(:all).and_return(@domains)
    end

    ['blacklisted.com', 'user@blacklisted.com', 'user@junk.de']
      .each do |blacklisted|

      it "returns true, when string is #{blacklisted}" do
        @validator.send(:blacklisted?, blacklisted)
          .should be_true
      end
    end

    it 'return false, when string does not match a domain' do
      @validator.send(:blacklisted?, 'user@other.com')
        .should be_false
    end
  end
end
