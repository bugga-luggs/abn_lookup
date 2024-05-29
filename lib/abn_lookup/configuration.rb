# frozen_string_literal: true

module AbnLookup
  class Configuration
    attr_accessor :guid

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def initialize
      @guid = nil
    end
  end
end
