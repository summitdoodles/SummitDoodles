class DamesController < ApplicationController
  # GET /dames
  # GET /dames.xml
  def index
    @dames = Dame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dames }
    end
  end

  # GET /dames/1
  # GET /dames/1.xml
  def show
    #not using
    #@dame = Dame.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @dame }
    #end
  end

  # GET /dames/new
  # GET /dames/new.xml
  def new
    @dame = Dame.new
    @breeds = Breed.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dame }
    end
  end

  # GET /dames/1/edit
  def edit
    @dame = Dame.find(params[:id])
    @breeds = Breed.find(:all)
  end

  # POST /dames
  # POST /dames.xml
  def create
    @dame = Dame.new(params[:dame])
    @breeds = Breed.find(:all)

    respond_to do |format|
      if @dame.save
        format.html { redirect_to(dames_path, :notice => 'Dame was successfully created.') }
        format.xml  { render :xml => @dame, :status => :created, :location => @dame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dames/1
  # PUT /dames/1.xml
  def update
    @dame = Dame.find(params[:id])
    @breeds = Breed.find(:all)

    respond_to do |format|
      if @dame.update_attributes(params[:dame])
        format.html { redirect_to(dames_path, :notice => 'Dame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dames/1
  # DELETE /dames/1.xml
  def destroy
    @dame = Dame.find(params[:id])
    @dame.destroy

    respond_to do |format|
      format.html { redirect_to(dames_url) }
      format.xml  { head :ok }
    end
  end
end
