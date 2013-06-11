require 'spec_helper'

describe Blacklist::DomainBlacklistValidator do
  before do
    @validator = Blacklist::DomainBlacklistValidator.new({ attributes: {} })
  end

  describe '#regexp_from(domain)' do

    it 'returns a regexp' do
      @validator.send(:regexp_from, 'some-domain.com').class
        .should eq(Regexp)
    end
  end

  describe '#blacklisted?(string)' do
    before do
      @domains = []
      @domains << Blacklist::Domain.new(domain: 'blacklisted.com')
      @domains << Blacklist::Domain.new(domain: 'junk.de')
      Blacklist::Domain.stub(:all).and_return(@domains)
    end

    it 'returns true, when string matches some domain' do
      @validator.send(:blacklisted?, 'www.blacklisted.com')
        .should be_true
    end

    it 'return false, when string does not match a domain' do
      @validator.send(:blacklisted?, 'www.other.com')
        .should be_false
    end
  end
end
