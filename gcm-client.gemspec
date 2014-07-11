$:.push File.expand_path("../lib", __FILE__)

require "gcm/version"

Gem::Specification.new do |s|
  s.name        = "gcm-client"
  s.version     = GCM::VERSION
  s.authors     = ["Charlie Smurthwaite"]
  s.email       = ["charlie@atechmedia.com"]
  s.homepage    = "http://atechmedia.com"
  s.summary     = "A Ruby client for GCM Proxy."
  s.description = "A Ruby client library for communicating with the GCM Proxy server."
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.licenses    = ['MIT']
end
