# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application"
  helper :all # include all helpers, all the time
  protect_from_forgery
  
    def send_pdf 
  	@report = Report.find(params[:id])
   	#send_data @article.pdf.url, :filename => ("pdf di".concat"#{@article.title}")
   	redirect_to @report.pdf.url
   end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :get_user_if_logged, :exept => 	:home
  
  protected
  def get_user_if_logged
  	if session[:user_id] then
  		@user = User.find(session[:user_id])
  	end
  end
end
