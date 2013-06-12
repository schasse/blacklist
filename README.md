# blacklist

[![Code Coverage](https://coveralls.io/repos/schasse/blacklist/badge.png?branch=master)](https://coveralls.io/r/schasse/blacklist)
[![Build Status](https://travis-ci.org/schasse/blacklist.png?branch=master)](https://travis-ci.org/schasse/blacklist)


Blacklist some domains p.e. for your email validation.

## INSTALLATION

    gem install blacklist

## EXAMPLE

    class User
      include Mongoid::Document
      include Mongoid::Timestamps

      field :email, type: String
      validates :email, domain_blacklist: true
    end
