# frozen_string_literal: true

module AbnLookup
  class AddParameter < Faraday::Middleware
    def initialize(app, parameter_name, parameter_value)
      super(app)
      @parameter_name = parameter_name
      @parameter_value = parameter_value
    end

    def call(env)
      params = env.url.query ? Faraday::Utils.parse_query(env.url.query) : {}
      params[@parameter_name] = @parameter_value
      env.url.query = Faraday::Utils.build_query(params)

      @app.call(env)
    end
  end
end
