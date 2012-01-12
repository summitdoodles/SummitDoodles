class AvailablePuppiesController < ApplicationController
  before_filter :load_data

  def index
    @puppies = Puppy.where("client_id is null")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def assign_puppy
    @puppy = Puppy.find(params[:current_puppy_id])
    @puppy.client_id = params[:current_client_id]

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to(@current_client, :notice => 'Puppy was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
   @puppy = Puppy.find(params[:current_puppy_id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @puppy = Puppy.find(params[:current_puppy_id])
    @clients = Client.find(:all)
  end

  def update
    @puppy = Puppy.find(params[:current_puppy_id])

    respond_to do |format|
      if @puppy.update_attributes(params[:puppy])
        format.html { redirect_to(@current_client, :notice => 'Puppy was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  private

  def load_data
    @current_client = Client.find(params[:current_client_id])
  end
end
