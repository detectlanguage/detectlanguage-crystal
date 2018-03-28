require "spec"
require "../src/detect_language"

def configured
  DetectLanguage.configure do |config|
    config.api_key = ENV["DETECTLANGUAGE_API_KEY"]
  end

  yield
end
