# frozen_string_literal: true

require "faraday"
require_relative "callback_parser"
require_relative "add_parameter"
require_relative "invalid_guid_error"

module AbnLookup
  class Client
    BASE_URL = "https://abr.business.gov.au/json/"

    Faraday::Response.register_middleware callback_parser: AbnLookup::CallbackParser

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter

      raise AbnLookup::InvalidGuidError, 'GUID not configued.' if AbnLookup.guid.nil?
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.response :callback_parser
        conn.use AbnLookup::AddParameter, "guid", AbnLookup.guid
        conn.use AbnLookup::AddParameter, "callback", "callback" # force to JSONP ever be callback

        conn.adapter adapter
      end
    end
  end
end
