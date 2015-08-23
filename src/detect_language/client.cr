require "http/client"
require "json"

module DetectLanguage
  class Client
    property :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def post(method, params)
      response = http_client.post_form(request_uri(method), request_params(params), headers)
      parse_response(response)      
    end

    private def request_params(params)
      params.merge({ "key" => configuration.api_key })
    end

    private def headers
      @headers ||= build_headers
    end

    private def build_headers
      headers = HTTP::Headers.new
      headers.add("User-Agent", configuration.user_agent)
      headers
    end

    private def parse_response(response)
      result = DetectResponse.from_json(response.body)
      
      if result.error
        error = result.error as ErrorData
        raise Error.new(error.message)
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