Embedly.configure do |config|
 # prints debug messages to the logger
 config.debug = true

 # use a custom logger
 config.logger = MyAwesomeLogger.new(STDERR)

 # Choose a request adatper (net_http, typhoeus or faraday)
 config.request_with :net_http
end
