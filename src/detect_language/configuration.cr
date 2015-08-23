module DetectLanguage
  class Configuration
    # The API key for your project, found on your homepage after you login into detectlanguage.com website
    # Defaults to 'demo', which has a limited number of requests.
    property :api_key

    # The API version you are using (defaults to 0.2).
    property :api_version

    # HTTP request user agent (defaults to 'Detect Language API ruby gem').
    property :user_agent

    # The host to connect to (defaults to ws.detectlanguage.com).
    property :host

    # The port on which your DetectLanguage server runs (defaults to 443 for secure
    # connections, 80 for insecure connections).
    property :port

    # +true+ for https connections, +false+ for http connections.
    property :secure

    alias_method :secure?, :secure

    def initialize
      @api_key = nil
      @api_version = "0.2"
      @host = "ws.detectlanguage.com"
      @user_agent = "Detect Language API Crystal Client " + VERSION
    end

    def port
      @port || default_port
    end

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end

    # Determines what port should we use for sending requests.
    # @return [Fixnum] Returns 443 if you've set secure to true in your
    # configuration, and 80 otherwise.
    private def default_port
      if secure?
        443
      else
        80
      end
    end
  end
end