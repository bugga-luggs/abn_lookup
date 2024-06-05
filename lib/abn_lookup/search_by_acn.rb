# frozen_string_literal: true

module AbnLookup
  class SearchByAcn
    class << self
      attr_accessor :stubs, :default_stub

      def fetch(acn, options = {})
        stub = stubs[acn] || default_stub
        raise stub if stub.is_a?(Exception)
        return stub if stub

        parse = options.fetch(:parse, true)
        response = AbnLookup.connection.get("AcnDetails.aspx?acn=#{acn.gsub(/\s/, '')}")
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
