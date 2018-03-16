require "spec"
require "../src/detect_language"

API_KEY = "c38b179b0b2861a77322e27be51e94ce"

def configured
  DetectLanguage.configure do |config|
    config.api_key = API_KEY
  end

  yield
end
