# frozen_string_literal: true

require "forwardable"
require "abn_lookup/configuration"
require "abn_lookup/client"
require "abn_lookup/search_by_abn"
require "abn_lookup/search_by_acn"
require "abn_lookup/search_by_name"
require "abn_lookup/abn"
require "abn_lookup/abn_not_found_error"
require "abn_lookup/invalid_guid_error"
require "abn_lookup/test"

require "faraday"

module AbnLookup
  class Error < StandardError; end

  @config = AbnLookup::Configuration.setup

  class << self
    extend Forwardable

    attr_accessor :config

    def_delegators :@config, :guid, :guid=

    def search_by_abn(abn, options = {})
      SearchByAbn.fetch(abn, options)
    end

    def search_by_acn(acn, options = {})
      SearchByAcn.fetch(acn, options)
    end

    def search_by_name(name)
      SearchByName.fetch(name)
    end

    def connection
      @client ||= AbnLookup::Client.new
      @client.connection
    end
  end
end
