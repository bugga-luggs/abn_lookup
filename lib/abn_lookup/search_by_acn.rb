# frozen_string_literal: true

module AbnLookup
  class SearchByAcn
    def self.fetch(acn)
      response = AbnLookup.connection.get("AcnDetails.aspx?acn=#{acn}")
      response.body
    end
  end
end
