module Hobby
  class Cors
    def initialize app
      @app = app
    end

    def call env
      status, headers, body = @app.call env
      headers['Access-Control-Allow-Origin'] = '*'
      [status, headers, body]
    end
  end
end
