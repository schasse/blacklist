require 'spec_helper'

describe User, 'DomainBlacklistValidator' do
  before do
    @domains = []
    @domains << 'blacklisted.com'
    @domains << 'junk.de'
    Blacklist::Domain.stub(:pluck).and_return(@domains)

    @user = User.new
  end

  describe 'validation of email' do

    it 'has error, when domain is on blacklist' do
      @user.email = 'user@blacklisted.com'
      @user.should have(1).error_on(:email)
    end

    it 'has no error, when domain is not on blacklist' do
      @user.email = 'user@other.com'
      @user.should have(:no).error_on(:email)
    end
  end
end
