module DetectLanguage
  class DetectResponse
    include JSON::Serializable

    property data : DetectData?
    property error : ErrorData?
  end

  class ErrorData
    include JSON::Serializable

    property message : String
  end

  class DetectData
    include JSON::Serializable

    property detections : Array(Detection)
  end

  class Detection
    include JSON::Serializable

    property language : String
    property isReliable : Bool
    property confidence : Float64

    def is_reliable?
      isReliable
    end
  end
end
