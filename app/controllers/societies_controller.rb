class SocietiesController < ApplicationController
  # GET /societies
  # GET /societies.xml
  def index
    @societies = Society.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @societies }
    end
  end

  # GET /societies/1
  # GET /societies/1.xml
  def show
    @society = Society.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @society }
    end
  end

  # GET /societies/new
  # GET /societies/new.xml
  def new
    @society = Society.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @society }
    end
  end

  # GET /societies/1/edit
  def edit
    @society = Society.find(params[:id])
  end

  # POST /societies
  # POST /societies.xml
  def create
    @society = Society.new(params[:society])

    respond_to do |format|
      if @society.save
        format.html { redirect_to(@society, :notice => 'Society was successfully created.') }
        format.xml  { render :xml => @society, :status => :created, :location => @society }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @society.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /societies/1
  # PUT /societies/1.xml
  def update
    @society = Society.find(params[:id])

    respond_to do |format|
      if @society.update_attributes(params[:society])
        format.html { redirect_to(@society, :notice => 'Society was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @society.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.xml
  def destroy
    @society = Society.find(params[:id])
    @society.destroy

    respond_to do |format|
      format.html { redirect_to(societies_url) }
      format.xml  { head :ok }
    end
  end
end
