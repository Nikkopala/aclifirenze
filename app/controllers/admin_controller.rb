class AdminController < ApplicationController
	before_filter :authorize, :except=>:login
  def login
  	session[:user_id] = nil
  	if request.post?
  		@user = User.check_login(params[:nikname], params[:password])
  		if @user
  			session[:user_id] = @user.id
  			session[:nikname] = @user.nikname
  			session[:society] = @user.society
  			session[:admin]   = @user.admin
  			redirect_to(:action => :index)
  		else flash.now[:notice]="Login errato. Nome e/o password errati"
  		end
  	end
  end

  def logout
  session[:user_id]= nil
  redirect_to(:action => :login)
  flash[:notice]="Hai effettuato il logout"
  end

  def index 
  end
	
  protected
  def authorize
		unless User.find_by_id(session[:user_id])
			flash[:notice]="Per favore effettua il login"
			redirect_to(:action=>:login)
	  end
	end

end
