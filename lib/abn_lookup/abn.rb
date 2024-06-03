module AbnLookup
  class Abn
    attr_accessor :abn, :abn_status, :abn_status_effective_from, :acn, :address_date,
                  :address_postcode, :address_state, :business_name, :entity_name,
                  :entity_type_code, :entity_type_name, :gst, :message

    def active?
      abn_status == "Active"
    end

    def inspect
      "#<#{self.class.name}:0x#{object_id} @abn=\"#{abn}\" @acn=\"#{acn}\" @active=\"#{active?}\" @gst=\"#{gst}\" @entity_name=\"#{entity_name}}\""
    end

    def self.parse(data)
      abn = Abn.new

      # Transforming PascalCase to snake_case
      snake_case = data.each_with_object({}) do |(key, value), new_hash|
        new_key = key.to_s.gsub(/([A-Z])/, '_\1').downcase
        new_hash[new_key.sub(/^_/, '').to_sym] = value
      end

      snake_case.each do |key, value|
        abn.send("#{key}=", value) if abn.respond_to?("#{key}=")
      end

      abn
    end
  end
end
