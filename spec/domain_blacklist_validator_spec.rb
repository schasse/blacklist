require 'spec_helper'

describe Blacklist::DomainBlacklistValidator do
  before do
    @validator = Blacklist::DomainBlacklistValidator.new attributes: {}
  end

  describe '#blacklisted?(string)' do
    before do
      @domains = []
      @domains << 'blacklisted.com'
      @domains << 'junk.de'
      Blacklist::Domain.stub(:pluck).and_return(@domains)
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

    ['fraud@other.blacklisted.com', 'user@otherother.junk.de', 'sub.junk.de']
      .each do |subdomain_email|

      it "returns true, when string is #{subdomain_email}" do
        @validator.send(:blacklisted?, subdomain_email)
          .should be_true
      end
    end
  end
end
