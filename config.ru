# This file is used by Rack-based servers to start the application.
require 'rack/reverse_proxy'

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::ReverseProxy do  
  # reverse_proxy /^\/blog(.*)$/, 'http://staunchrobotsblog.herokuapp.com/blog$1', 
  reverse_proxy /^\/blog(.*)$/, 'http://morrillandcompany.com/staunch$1', opts={:preserve_host => true}
end

run Rails.application
