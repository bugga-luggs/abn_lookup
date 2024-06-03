# frozen_string_literal: true

module AbnLookup
  class AbnNotFoundError < StandardError
    def initialize(msg = 'ABN not found')
      super
    end
  end
end
