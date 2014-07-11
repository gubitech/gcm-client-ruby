# Client for GCM Proxy

This is a Ruby client library for applications which wish to use the HTTP 
API provided by the [GCM Proxy](http://github.com/catphish/gcm-proxy) 
application.

## Installation

As with most Rubygems, just add the gcm-client gem to your Gemfile and run
bundle to install it.

```ruby
gem 'gcm-client', '~> 1.0'
```

Once installed, you can simply require it using `require 'gcm'`.

## Usage

Using the library is simple. In this example, be sure to replace the URL
and auth key with the correct information for your GCM proxy installation.

```ruby
# Create a client object
client = GCM::Client.new('https://apns.yourdomain.com', 'abc123abc123')

# Create a notification
notification = GCM::Notification.new
notification.data = {"Message" => "Hello World!"}

# Send the notification to a device. 
response = client.notify(device_identifier, notification)
response.success?               # => Has the notification been added successfully?
response.device_unsubscribed?   # => Has the device been unsubscribed?
```
