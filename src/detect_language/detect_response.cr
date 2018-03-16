module DetectLanguage
  class DetectResponse
    JSON.mapping({
      data:  {type: DetectData, nilable: true},
      error: {type: ErrorData, nilable: true},
    })
  end

  class ErrorData
    JSON.mapping({
      message: String,
    })
  end

  class DetectData
    JSON.mapping({
      detections: Array(Detection),
    })
  end

  class Detection
    JSON.mapping({
      language:   String,
      isReliable: Bool,
      confidence: Float64,
    })
  end
end
