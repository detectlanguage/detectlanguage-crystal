module DetectLanguage
  class DetectResponse
    json_mapping({
      data: { type: DetectData, nilable: true },
      error: { type: ErrorData, nilable: true },
    })
  end

  class ErrorData
    json_mapping({
      message: String,
    })
  end  

  class DetectData
    json_mapping({
      detections: Array(Detection),
    })
  end

  class Detection
    json_mapping({
      language: String,
      isReliable: Bool,
      confidence: Float64,
    })

    alias_method :is_reliable?, :isReliable
  end
end