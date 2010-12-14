# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	session :session_key => '_aclifirenze_session_id'
  helper :all # include all helpers, all the time
  protect_from_forgery :secret=>'500280671790f0dbe0d3705fe6cf49530f9cd9bcc98390477f6bfdd926cc8c53f8765bbcda475ab5fae430c3b3af3a5f06455e7e7ad21e9f9c5f931f7ccda7f0' # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
