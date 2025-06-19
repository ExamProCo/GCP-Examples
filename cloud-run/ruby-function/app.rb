require "functions_framework"

FunctionsFramework.http "hello_get" do |_request|
  # The request parameter is a Rack::Request object.
  # See https://www.rubydoc.info/gems/rack/Rack/Request

  # Return the response body as a string.
  # You can also return a Rack::Response object, a Rack response array, or
  # a hash which will be JSON-encoded into a response.
  "Hello World!"
end