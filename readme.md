## Introduction

Hobby-CORS is a [Rack][rack] middleware for [CORS][cors], with permissive defaults. It is available on RubyGems as [hobby-cors][hobby-cors].

By default, it responds with permissive headers to POST requests from any origin. You can use it with [Hobby] as follows:

```ruby
require 'hobby'
require 'hobby/cors'

class App
  include Hobby
  use CORS

  post {
    'return some value'
  }
end
```

To restrict the origins for which CORS will be allowed,
you can pass an `origins` Array:

```ruby
require 'hobby'
require 'hobby/cors'

class App
  include Hobby

  def initialize cors_origins: nil
    if cors_headers
      use CORS, origins: cors_origins
    else
      use CORS
    end
  end

  post {
    'return some value'
  }
end

```

## Development

To run the specs:

```
bundle exec rspec
```

[rack]: https://github.com/rack/rack
[cors]: https://en.wikipedia.org/wiki/Cross-origin_resource_sharing
[hobby-cors]: https://rubygems.org/gems/hobby-cors
[hobby]: https://github.com/ch1c0t/hobby
