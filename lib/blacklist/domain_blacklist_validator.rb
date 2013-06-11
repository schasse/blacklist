module Blacklist
  class DomainBlacklistValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      if blacklisted? value
        record.errors.add attribute, :blacklisted
      end
    end

    private

    def regexp_from(domain)
      Regexp.new domain if domain
    end

    def blacklisted?(string)
      Domain.all.map { |black| string =~ regexp_from(black.domain) }
        .reduce(:|)
    end
  end
end
