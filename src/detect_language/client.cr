require "http/client"
require "json"

module DetectLanguage
  class Client
    @headers : HTTP::Headers | Nil
    property configuration : Configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def post(method, params)
      response = http_client.post(path: request_uri(method), headers: headers, form: params)
      parse_response(response)
    end

    private def headers
      @headers ||= build_headers
    end

    private def build_headers
      headers = HTTP::Headers.new
      headers.add("User-Agent", configuration.user_agent)
      headers.add("Authorization", "Bearer " + configuration.api_key)
      return headers
    end

    private def parse_response(response)
      result = DetectResponse.from_json(response.body)

      if result.error
        error = result.error.not_nil!
        raise error.message
      end

      result
    end

    def request_uri(method)
      "/#{configuration.api_version}/#{method}"
    end

    private def http_client
      @http_client ||= HTTP::Client.new(configuration.host, configuration.port, configuration.secure)
    end
  end
end
