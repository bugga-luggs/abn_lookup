# frozen_string_literal: true

module AbnLookup
  class SearchByAcn
    class << self
      attr_accessor :stubs, :default_stub

      def fetch(acn)
        stub = stubs[acn] || default_stub
        return stub if stub

        response = AbnLookup.connection.get("AcnDetails.aspx?acn=#{acn.gsub(/\s/, '')}")
        body  = response.body

        raise InvalidGuidError if body["Message"] == "The GUID entered is not recognised as a Registered Party"
        raise AbnNotFoundError if body["Abn"].empty?

        Abn.parse(body)
      end
    end

    @stubs = {}
    @default_stub = nil
  end
end
