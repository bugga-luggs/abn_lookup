# frozen_string_literal: true

module AbnLookup
  class SearchByAbn
    def self.fetch(abn)
      response = AbnLookup.connection.get("AbnDetails.aspx?abn=#{abn.gsub(/\s/, '')}")
      body  = response.body

      raise InvalidGuidError if body["Message"] == "The GUID entered is not recognised as a Registered Party"
      raise AbnNotFoundError if body["Abn"].empty?

      AbnFormatter.formatter(body)
    end
  end
end
