class WeightReportsController < ApplicationController
  # GET /weight_reports
  # GET /weight_reports.xml
  def index

    @filter_choices =  [["No filter",nil],
                        ["Color","color_id"],
                        ["Litter","litter_id"],
                        ["Gender","gender_id"]]
    filter_type = params[:weight_report_filter_type]

    if !filter_type.blank?
      #get values for filter
      case filter_type
        when "color_id"
          @filter = Color.find(:all)
        when "litter_id"
          @filter = Litter.find(:all)
        when "gender_id"
          @filter = Gender.find(:all)
      end

      filter = params[:weight_report_filter]
      #if no param then default to first in filter type list
      if filter.blank?
        filter = @filter[0].id
      end
    end


    if filter_type.blank?
      @puppies = Puppy.where("puppies.id IN (?)",Weight.select(:puppy_id).map(&:puppy_id).uniq)
    else
     @puppies = Puppy.where(filter_type+"= ? and puppies.id IN (?)",filter.to_s,Weight.select(:puppy_id).map(&:puppy_id).uniq)
    end

    #sory by weight, Heaviest first
    @puppies.sort!{|a,b| b.newest_weight.weight_as_decimal <=> a.newest_weight.weight_as_decimal}

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /weight_reports/1
  # GET /weight_reports/1.xml
  def show
    @weights = Weight.find_all_by_puppy_id(params[:id],:order=>"date DESC")
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  private



end
