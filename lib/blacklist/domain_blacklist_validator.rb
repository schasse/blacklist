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
        Domain.pluck(:domain).reduce(false) do |result, domain|
          result || string == domain || string.end_with?(".#{domain}")
        end
      end
  end
end
