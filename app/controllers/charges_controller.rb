class ChargesController < ApplicationController

  before_filter :load_data

  # GET /charges
  # GET /charges.xml
  def index
    @charges = @client.charges.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /charges/1
  # GET /charges/1.xml
  def show
    @charge = Charge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /charges/new
  # GET /charges/new.xml
  def new
    @charge = Charge.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /charges/1/edit
  def edit
    @charge = Charge.find(params[:id])
  end

  # POST /charges
  # POST /charges.xml
  def create
    @charge = @client.charges.build(params[:charge])

    respond_to do |format|
      if @charge.save
        format.html { redirect_to(@client, :notice => 'Charge was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /charges/1
  # PUT /charges/1.xml
  def update
    @charge = Charge.find(params[:id])

    respond_to do |format|
      if @charge.update_attributes(params[:charge])
        format.html { redirect_to(@client, :notice => 'Charge was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.xml
  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy

    respond_to do |format|
      format.html { redirect_to(@client) }
    end
  end

  private

    def load_data
      @client = Client.find(params[:client_id])
      @charge_types = ChargeType.find(:all)
      @puppies = @client.puppies.find(:all)
    end

end
