# frozen_string_literal: true

module AbnLookup
  class SearchByAbn
    def self.fetch(abn)
      response = AbnLookup.connection.get("AbnDetails.aspx?abn=#{abn}")
      response.body
    end
  end
end
