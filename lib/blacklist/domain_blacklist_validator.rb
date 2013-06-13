module Blacklist
  class DomainBlacklistValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      if blacklisted? value
        record.errors.add attribute, :domain_blacklisted
      end
    end

    private

      def blacklisted?(string)
        string = string.split('@').last
        Domain.all.map { |black| black.domain.include? string }
          .reduce(false, :|)
      end
  end
end
