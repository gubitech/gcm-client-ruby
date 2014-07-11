require 'uri'
require 'net/https'
require 'json'

module GCM
  class Client
    
    attr_reader :uri, :auth_token
    
    def initialize(uri, auth_key)
      @uri = URI.parse(uri)
      @auth_key = auth_key
    end
    
    #
    # Send a notification to a device
    #
    def notify(device, notification)
      response = make_request(:notify, {:device => device, :data => notification.data})
      NotificationResponse.new(response)
    end
    
    private
    
    #
    # Make an HTTP request
    def make_request(method, payload = {})
      request = Net::HTTP::Post.new("/api/#{method}")
      request.body = payload.merge({:auth_key => @auth_key}).to_json
      request.add_field 'User-Agent', "GCM Ruby Client Library/#{GCM::VERSION}"
      connection = Net::HTTP.new(@uri.host, @uri.port)
      if @uri.is_a?(URI::HTTPS)
        connection.use_ssl = true
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = connection.request(request)
      Response.new(result)
    end
    
  end
end
