# frozen_string_literal: true

module AbnLookup
  class SearchByAcn
    def self.fetch(acn)
      response = AbnLookup.connection.get("AcnDetails.aspx?acn=#{acn.gsub(/\s/, '')}")
      response.body

      raise InvalidGuidError if body["Message"] == "The GUID entered is not recognised as a Registered Party"
      raise AbnNotFoundError if body["Abn"].empty?

      AbnFormatter.formatter(body)
    end
  end
end
