require "json"
require "./detect_language/version"
require "./detect_language/configuration"
require "./detect_language/error"
require "./detect_language/client"
require "./detect_language/detect_response"

module DetectLanguage
  extend self

  def configure
    yield(configuration)
  end

  def configuration
    @@configuration ||= Configuration.new
  end

  def client
    @@client ||= Client.new(configuration)
  end

  def detect(data : String)
    result = client.post(:detect, { "q" => data })
    data = result.data as DetectData
    data.detections
  end
end
