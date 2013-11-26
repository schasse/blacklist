# -*- coding: utf-8 -*-
require 'spec_helper'

describe Blacklist::Domain do

  describe 'validation of domain' do
    before { @domain = Blacklist::Domain.new }
    subject { @domain }

    it { should have(2).errors_on(:domain) }

    context 'with invalid url, contains whitespace' do
      before { @domain.domain = ' other.com' }
      it { should have(1).error_on(:domain) }
    end

    context 'with invalid url, contains special char' do
      before { @domain.domain = 'otheræ.com' }
      it { should have(1).error_on(:domain) }
    end

    context 'with invalid url, contains newline' do
      before { @domain.domain = "correct.org\notheræ.com" }
      it { should have(1).error_on(:domain) }
    end

    context 'with valid url' do
      before { @domain.domain = 'some-domain.com' }
      it { should have(:no).error_on(:domain) }
    end
  end
end
