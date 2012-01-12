class SiresController < ApplicationController
  # GET /sires
  # GET /sires.xml
  def index
    @sires = Sire.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sires }
    end
  end

  # GET /sires/1
  # GET /sires/1.xml
  def show
    #not usgin
    #@sire = Sire.find(params[:id])   
    
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @sire }
    #end
  end

  # GET /sires/new
  # GET /sires/new.xml
  def new
    @sire = Sire.new
    @breeds = Breed.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sire }
    end
  end

  # GET /sires/1/edit
  def edit
    @sire = Sire.find(params[:id])
    @breeds = Breed.find(:all)
  end

  # POST /sires
  # POST /sires.xml
  def create
    @sire = Sire.new(params[:sire])
    @breeds = Breed.find(:all)
    
    respond_to do |format|
      if @sire.save
        format.html { redirect_to(sires_path, :notice => 'Sire was successfully created.') }
        format.xml  { render :xml => @sire, :status => :created, :location => @sire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sires/1
  # PUT /sires/1.xml
  def update
    @sire = Sire.find(params[:id])
    @breeds = Breed.find(:all)
    
    respond_to do |format|
      if @sire.update_attributes(params[:sire])
        format.html { redirect_to(sires_path, :notice => 'Sire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sires/1
  # DELETE /sires/1.xml
  def destroy
    @sire = Sire.find(params[:id])
    @sire.destroy

    respond_to do |format|
      format.html { redirect_to(sires_url) }
      format.xml  { head :ok }
    end
  end
end
