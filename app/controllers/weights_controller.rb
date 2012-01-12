class WeightsController < ApplicationController
  
  # GET /weights/
  def index
    @litters = Litter.find(:all,:order=>"birthday DESC")
    @weight = Weight.new
    @weight.puppy_id=params[:selected_weight_puppy_filter]
    @weight.date=params[:new_date] unless params[:new_date].blank?
    @weight.lb=params[:new_lb] unless params[:new_lb].blank?
    @weight.oz=params[:new_oz] unless params[:new_oz].blank?

    getWeights

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # GET /weights/siteHTM
  def siteHTM
    @litters = Litter.find(:all,:order=>"birthday DESC")

    getWeights

    @weight_htm="<!-- " + @weights[0].puppy.name_with_collar_color_and_litter.to_s + " -->\n" unless @weights.blank?
    
    @weights.each do |w|
        @weight_htm = @weight_htm + getWeightHTM(w)
    end
    
    respond_to do |format|
      format.html # siteHTM.html.erb
    end
  end

  # GET /weights/1
  # GET /weights/1.xml
  def show
    #NOT USING
    #@weight = Weight.find(params[:id])

    #respond_to do |format|
     # format.html # show.html.erb
     # format.xml  { render :xml => @weight }
    #end
  end

  # GET /weights/new
  # GET /weights/new.xml
  def new
    #NO LONGER USED!!
    @weight = Weight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weight }
    end
  end

  # GET /weights/1/edit
  def edit
    @weight = Weight.find(params[:id])
  end

  # POST /weights
  # POST /weights.xml
  def create
    @weight = Weight.new(params[:weight])
    
    respond_to do |format|
      if @weight.save

        format.html { redirect_to(weights_path(:selected_weight_litter_filter=>params[:selected_weight_litter_filter],
                                               :selected_weight_puppy_filter=>params[:selected_weight_puppy_filter],
                                               :new_date=>@weight.date,
                                               :new_lb=>@weight.lb,
                                               :new_oz=>@weight.oz ),
                                  :notice => 'Weight for date '+@weight.date.strftime("%m/%d/%Y") +
                                             ' was successfully created.') }
      else
        format.html { redirect_to(weights_path,
                                  :notice => 'Please correct '+@weight.errors.count.to_s+' error(s).') }
      end
    end
  end

  # PUT /weights/1
  # PUT /weights/1.xml
  def update
    @weight = Weight.find(params[:id])
    @puppies = Puppy.all

    respond_to do |format|
      if @weight.update_attributes(params[:weight])
        format.html { redirect_to(weights_path(:selected_weight_litter_filter=>params[:selected_weight_litter_filter],
                                               :selected_weight_puppy_filter=>params[:selected_weight_puppy_filter]),
                                  :notice => 'Weight was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.xml
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.html { redirect_to(weights_url(:selected_weight_litter_filter=>params[:selected_weight_litter_filter],
                                            :selected_weight_puppy_filter=>params[:selected_weight_puppy_filter]) ) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def getWeights
    
    litter_filter_id = params[:selected_weight_litter_filter]
    puppy_filter_id = params[:selected_weight_puppy_filter]
    
    #nothing in param so default to first record, no litters this will blow . . .o well
    litter_filter_id=@litters[0].id if !litter_filter_id or litter_filter_id.empty?

    #populate puppy drop down using litter filter id
    @puppies = Puppy.find_all_by_litter_id(litter_filter_id,:order=>"name")
    
    if puppy_filter_id and !puppy_filter_id.empty?
      #have puppy_filter_id
      @weights = Weight.find_all_by_puppy_id(puppy_filter_id,:order=>"date DESC")
    else    
      @weights = Weight.joins(:puppy).where(:puppies => {:litter_id=>litter_filter_id}).order("puppy_id DESC, date DESC")
    end
  end
  
  def getWeightHTM(weight)
    return "<tr><td>#{weight.date}</td><td>#{weight.lb} LB #{weight.oz} OZ </td></tr>\n"
  end

end
