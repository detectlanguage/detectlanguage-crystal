# detect_language

[![Build Status](https://travis-ci.org/detectlanguage/detectlanguage-crystal.svg?branch=master)](https://travis-ci.org/detectlanguage/detectlanguage-crystal)
[![GitHub release](https://img.shields.io/github/release/detectlanguage/detectlanguage-crystal.svg)](https://github.com/detectlanguage/detectlanguage-crystal/releases)

Detect Language API Crystal Client

## Installation

Add it to `shard.yml`

```crystal
dependencies:
  detect_language:
    github: detectlanguage/detectlanguage-crystal
    branch: master
```

## Usage

```crystal
require "detect_language"

DetectLanguage.configure do |config|
  config.api_key = "YOUR API KEY"
end
```

### Language detection

```crystal
results = DetectLanguage.detect("Buenos dias señor")

pp results[0].language
```

## Contributing

1. Fork it ( https://github.com/detectlanguage/detectlanguage-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
