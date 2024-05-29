# frozen_string_literal: true

module AbnLookup
  class SearchByName
    def self.fetch(name, max_result = 10)
      response = AbnLookup.connection.get("MatchingNames.aspx?name=#{name}&maxResults=#{max_result}")
      response.body
    end
  end
end
