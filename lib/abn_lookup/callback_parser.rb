# frozen_string_literal: true

# This class is used to parse the JSON response from the ABN Lookup API
# The API returns a JSONP response, which is a JSON response wrapped in a callback function
module AbnLookup
  class CallbackParser < Faraday::Response::Middleware
    def on_complete(env)
      return unless env[:body].is_a?(String)

      # removing callback() from the response and parsing the JSON
      json_string = env[:body].match(/callback\((.*)\)/)[1]
      env[:body] = JSON.parse(json_string)
    end
  end
end
