class LittersController < ApplicationController
  # GET /litters
  # GET /litters.xml
  def index
    @litters = Litter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @litters }
    end
  end

  # GET /litters/1
  # GET /litters/1.xml
  def show
  #not using
    #@litter = Litter.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @litter }
    #end
  end

  # GET /litters/new
  # GET /litters/new.xml
  def new
    @litter = Litter.new
    @sires = Sire.find(:all,:order=>"name")
    @dames = Dame.find(:all,:order=>"name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @litter }
    end
  end

  # GET /litters/1/edit
  def edit
    @litter = Litter.find(params[:id])
    @sires = Sire.find(:all,:order=>"name")
    @dames = Dame.find(:all,:order=>"name")
  end

  # POST /litters
  # POST /litters.xml
  def create
    @litter = Litter.new(params[:litter])
    @sires = Sire.find(:all,:order=>"name")
    @dames = Dame.find(:all,:order=>"name")

    respond_to do |format|
      if @litter.save
        format.html { redirect_to(litters_path, :notice => 'Litter was successfully created.') }
        format.xml  { render :xml => @litter, :status => :created, :location => @litter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @litter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /litters/1
  # PUT /litters/1.xml
  def update
    @litter = Litter.find(params[:id])
    @sires = Sire.find(:all,:order=>"name")
    @dames = Dame.find(:all,:order=>"name")

    respond_to do |format|
      if @litter.update_attributes(params[:litter])
        format.html { redirect_to(litters_path, :notice => 'Litter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @litter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /litters/1
  # DELETE /litters/1.xml
  def destroy
    @litter = Litter.find(params[:id])
    @litter.destroy

    respond_to do |format|
      format.html { redirect_to(litters_url) }
      format.xml  { head :ok }
    end
  end
end
