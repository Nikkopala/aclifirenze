class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  before_filter :authorize
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
	@circoli_a = Array.new
    @circoli =  Society.find(:all)
    @circoli.each do |c|
    	@circoli_a << c.society
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @circoli_a = Array.new
    @circoli =  Society.find(:all)
    @circoli.each do |c|
    	@circoli_a << c.society
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    #controllo di non togliere il permesso di amministrazione all' ultimo admin
		unless User.find_by_admin(true).to_a.count == 1 and @user.admin? then
			respond_to do |format|
		  	if @user.update_attributes(params[:user]) then
		    	format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
		      format.xml  { head :ok }
		    else
		      format.html { render :action => "show" }
		      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
		    end
			end
		else
			flash[:notice] = "Le modifiche non sono state effettuate"
			flash[:error] = "Non puoi levare il permesso di amministratore all' ultimo amministratore!!"
			respond_to do |format|
				format.html { render :action => "show" }
			end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
  	unless User.find_by_admin(true).to_a.count == 1
    	@user = User.find(params[:id])
    	@user.destroy
    else
    	flash[:notice]="Non puoi eliminare l'ultimo admministratore'"
		end
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def authorize
		unless User.find_by_id(session[:user_id])
			flash[:notice]="Per favore effettua il login"
			redirect_to(:controller =>:admin ,:action=>:login)
	  end
	end
end
