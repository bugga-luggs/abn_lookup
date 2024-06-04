# frozen_string_literal: true

module AbnLookup
  class SearchByAbn
    class << self
      attr_accessor :stubs, :default_stub

      def fetch(abn, options = {})
        stub = stubs[abn] || default_stub
        return stub if stub

        parse = options.fetch(:parse, true)
        response = AbnLookup.connection.get("AbnDetails.aspx?abn=#{abn.gsub(/\s/, '')}")
        body  = response.body

        raise InvalidGuidError if body["Message"] == "The GUID entered is not recognised as a Registered Party"
        raise AbnNotFoundError if body["Abn"].empty? || body["Message"] == "No record found"

        parse ? Abn.parse(body) : body
      end
    end

    @stubs = {}
    @default_stub = nil
  end
end
