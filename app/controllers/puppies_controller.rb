class PuppiesController < ApplicationController
  # GET /puppies
  def index
    @litters = Litter.find(:all,:order=>"birthday DESC")
    
    filter = params[:selected_litter_filter] 
    
    if filter and !filter.empty?
      @puppies = Puppy.find_all_by_litter_id(filter)
    else
      @puppies = Puppy.all
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /puppies/1
  # GET /puppies/1.xml
  def show
    #NOT USING
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @puppy }
    end
  end

  # GET /puppies/new
  # GET /puppies/new.xml
  def new
    @puppy = Puppy.new
    @genders = Gender.find(:all,:order=>"gender")
    @colors = Color.all
    @litters = Litter.find(:all,:order=>"birthday DESC")
    @clients = Client.all
    
    #set defalut gender to unknown
    @puppy.gender_id = Gender.where(:gender=>"Unknown")[0].id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @puppy }
    end
  end

  # GET /puppies/1/edit
  def edit
    @puppy = Puppy.find(params[:id])
    @genders = Gender.find(:all,:order=>"gender")
    @colors = Color.all
    @litters = Litter.find(:all,:order=>"birthday DESC")
    @clients = Client.all

  end

  # POST /puppies
  # POST /puppies.xml
  def create
    @puppy = Puppy.new(params[:puppy])
    @genders = Gender.find(:all,:order=>"gender")
    @colors = Color.all
    @litters = Litter.find(:all,:order=>"birthday DESC")
    @clients = Client.all


    respond_to do |format|
      if @puppy.save
        format.html { redirect_to(puppies_path, :notice => 'Puppy was successfully created.') }
        format.xml  { render :xml => @puppy, :status => :created, :location => @puppy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @puppy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /puppies/1
  # PUT /puppies/1.xml
  def update
    @puppy = Puppy.find(params[:id])
    @genders = Gender.find(:all,:order=>"gender")
    @colors = Color.all
    @litters = Litter.find(:all,:order=>"birthday DESC")
    @clients = Client.all


    respond_to do |format|
      if @puppy.update_attributes(params[:puppy])
        format.html { redirect_to(puppies_path, :notice => 'Puppy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @puppy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /puppies/1
  # DELETE /puppies/1.xml
  def destroy
    @puppy = Puppy.find(params[:id])
    @puppy.destroy

    respond_to do |format|
      format.html { redirect_to(puppies_url) }
      format.xml  { head :ok }
    end
  end

end
