require "./spec_helper"

describe DetectLanguage do
  it "configures" do
    configured do
      DetectLanguage.configuration.api_key.should eq(API_KEY)
      DetectLanguage.configuration.host.should eq("ws.detectlanguage.com")
      DetectLanguage.configuration.user_agent.should contain("Detect Language API Crystal Client")
      DetectLanguage.configuration.user_agent.should contain(DetectLanguage::VERSION)
    end
  end

  it "allows configuring" do
    DetectLanguage.configure do |config|
      config.user_agent = "Detect Language testing"
    end

    DetectLanguage.configuration.user_agent.should eq("Detect Language testing")
  end

  describe ".detect" do
    it "detects languages" do
      configured do
        results = DetectLanguage.detect("Hello world")
        results[0].language.should eq("en")
        results[0].is_reliable?.should be_true
        results[0].confidence.should be_a(Float64)

        results = DetectLanguage.detect("Jau saulelė vėl atkopdama budino svietą")
        results[0].language.should eq("lt")
      end
    end
  end
end
