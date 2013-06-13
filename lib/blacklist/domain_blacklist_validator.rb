module Blacklist
  class DomainBlacklistValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      if blacklisted? value
        record.errors.add attribute, :domain_blacklisted
      end
    end

    private

      def regexp_from(domain)
        ::Regexp.new domain if domain
      end

      def blacklisted?(string)
        string = regexp_from(string.split('@').last)
        Domain.all.map { |black| black.domain =~ string }
          .reduce(false, :|)
      end
  end
end
