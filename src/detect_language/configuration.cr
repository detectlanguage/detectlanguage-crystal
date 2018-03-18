module DetectLanguage
  class Configuration
    # The API key for your project, found on your homepage after you login into detectlanguage.com website
    # Defaults to 'demo', which has a limited number of requests.
    property api_key : String

    # The API version you are using (defaults to 0.2).
    property api_version : String

    # HTTP request user agent (defaults to 'Detect Language API ruby gem').
    property user_agent : String

    # The host to connect to (defaults to ws.detectlanguage.com).
    property host : String

    # The port on which your DetectLanguage server runs (defaults to 443 for secure
    # connections, 80 for insecure connections).
    property port : Int32

    # +true+ for https connections, +false+ for http connections.
    property secure : Bool

    def initialize
      @api_key = ""
      @api_version = "0.2"
      @host = "ws.detectlanguage.com"
      @user_agent = "Detect Language API Crystal Client " + VERSION
      @secure = true
      @port = 443
    end

    def port
      @port ||= 443
    end

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end
  end
end
