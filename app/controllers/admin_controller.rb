class AdminController < ApplicationController
	before_filter :authorize, :except=>:login
  def login
  	session[:user_id] = nil
  	if request.post?
  		@user = User.check_login(params[:name], params[:password])
  		if @user
  			session[:user_id] = @user.id
  			redirect_to (:action => :index)
  		else flash.now[:notice]="Login errato. Nome e/o password errati"
  		end
  	end
  end

  def logout
  session[:user_id]= nil
  redirect_to (:action => :login)
  flash[:notice]="Hai effettuato il logout"
  end

  def index 
  @rico=session[:user_id][:society]
  end
	
  protected
  def authorize
		unless User.find_by_id(session[:user_id])
			flash[:notice]="Per favore effettua il login"
			redirect_to (:action=>:login)
	  end
	end

end
