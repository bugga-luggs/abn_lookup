# frozen_string_literal: true

module AbnLookup
  class InvalidGuidError < StandardError
    def initialize(msg = 'InvalidGuidError: GUID is invalid')
      super
    end
  end
end
