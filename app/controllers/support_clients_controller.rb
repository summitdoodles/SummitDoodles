class SupportClientsController < ApplicationController
  before_filter :load_data

  # GET /support_clients
  # GET /support_clients.xml
  def index
    @support_clients = @client.support_clients.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_clients }
    end
  end

  # GET /support_clients/1
  # GET /support_clients/1.xml
  def show
    @support_client = SupportClient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_client }
    end
  end

  # GET /support_clients/new
  # GET /support_clients/new.xml
  def new
    @support_client = SupportClient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_client }
    end
  end

  # GET /support_clients/1/edit
  def edit
    @support_client = SupportClient.find(params[:id])
  end

  # POST /support_clients
  # POST /support_clients.xml
  def create
    @support_client = @client.support_clients.build(params[:support_client])

    respond_to do |format|
      if @support_client.save
        format.html { redirect_to(@client, :notice => 'Support client was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /support_clients/1
  # PUT /support_clients/1.xml
  def update
    @support_client = SupportClient.find(params[:id])

    respond_to do |format|
      if @support_client.update_attributes(params[:support_client])
        format.html { redirect_to(@client, :notice => 'Support client was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /support_clients/1
  # DELETE /support_clients/1.xml
  def destroy
    @support_client = SupportClient.find(params[:id])
    @support_client.destroy

    respond_to do |format|
      format.html { redirect_to(@client) }
    end
  end

  private

  def load_data
    @client = Client.find(params[:client_id])
    @relations = Relation.all
  end

end
