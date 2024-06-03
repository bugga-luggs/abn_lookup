# frozen_string_literal: true

module AbnLookup
  class AbnFormatter
    def self.formatter(body)
      hash = {
        abn: body["Abn"],
        abn_status: body["AbnStatus"],
        abn_status_effective_from: body["AbnStatusEffectiveFrom"],
        acn: body["Acn"],
        address_date: body["AddressDate"],
        address_postcode: body["AddressPostcode"],
        address_state: body["AddressState"],
        business_name: body["BusinessName"],
        entity_name: body["EntityName"],
        entity_type_code: body["EntityTypeCode"],
        entity_type_name: body["EntityTypeName"],
        gst: body["Gst"],
        message: body["Message"]
      }

      # build Struct
      abn = Struct.new(*hash.keys)

      # converting hash to struct
      abn.new(*hash.values)
    end
  end
end
