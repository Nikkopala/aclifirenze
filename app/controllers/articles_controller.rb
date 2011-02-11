class ArticlesController < ApplicationController
  before_filter :authorize
  uses_tiny_mce
  
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    
    @circoli_a = Array.new
    @circoli =  Society.find(:all)
    @circoli.each do |c|
    	@circoli_a << c.society
    end 	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @circoli_a = Array.new
    @circoli =  Society.find(:all)
    @circoli.each do |c|
    	@circoli_a << c.society
    end
    if request.post?
#   	render :text => params[:article].inspect
    	unless params[:article][:photo].nil?
		  	@article.photo = params[:article][:photo]
		  	@article.save!
		  end
#    	redirect_to "/articles/show/#{@article.id}"
    end
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
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
