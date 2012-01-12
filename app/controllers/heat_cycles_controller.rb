class HeatCyclesController < ApplicationController
  # GET /heat_cycles
  # GET /heat_cycles.xml
  def index
    @dames = Dame.find(:all,:order=>"name")
    
    filter = params[:selected_dame_filter] 
    
    if filter and !filter.empty?
      @heat_cycles = HeatCycle.find_all_by_dame_id(filter,:order=>"dame_id, date DESC")      
    else
      @heat_cycles = HeatCycle.find(:all,:order=>"dame_id, date DESC")      
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /heat_cycles/1
  # GET /heat_cycles/1.xml
  def show
    #not useing
    #@heat_cycle = HeatCycle.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @heat_cycle }
    #end
  end

  # GET /heat_cycles/new
  # GET /heat_cycles/new.xml
  def new
    @heat_cycle = HeatCycle.new
    @dames = Dame.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heat_cycle }
    end
  end

  # GET /heat_cycles/1/edit
  def edit
    @heat_cycle = HeatCycle.find(params[:id])
    @dames = Dame.find(:all)
  end

  # POST /heat_cycles
  # POST /heat_cycles.xml
  def create
    @heat_cycle = HeatCycle.new(params[:heat_cycle])
    @dames = Dame.find(:all)

    respond_to do |format|
      if @heat_cycle.save
        format.html { redirect_to(heat_cycles_path, :notice => 'Heat cycle was successfully created.') }
        format.xml  { render :xml => @heat_cycle, :status => :created, :location => @heat_cycle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heat_cycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heat_cycles/1
  # PUT /heat_cycles/1.xml
  def update
    @heat_cycle = HeatCycle.find(params[:id])
    @dames = Dame.find(:all)

    respond_to do |format|
      if @heat_cycle.update_attributes(params[:heat_cycle])
        format.html { redirect_to(heat_cycles_path, :notice => 'Heat cycle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heat_cycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heat_cycles/1
  # DELETE /heat_cycles/1.xml
  def destroy
    @heat_cycle = HeatCycle.find(params[:id])
    @heat_cycle.destroy

    respond_to do |format|
      format.html { redirect_to(heat_cycles_url) }
      format.xml  { head :ok }
    end
  end
end
