class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.xml
  def index
    
    @filter_choices =  [["Last Name","last_name"],
                        ["First Name","first_name"],
                        ["Email","email"],
                        ["Phone number","phone_number"],
                        ["2nd phone number","secondary_phone_number"],
                        ["Address 1","address_1"],
                        ["City","city"],                        
                        ["Zip","zip"] ]
                        
                      
    if params[:client_filter_text].blank?
      @clients = Client.all
    else
      @clients = Client.where(params[:client_filter_selection]+" LIKE ?","%"+params[:client_filter_text]+"%")
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])
    @states = State.find(:all,:order=>"short_name")
    @genders = Gender.find(:all)
    @support_clients = @client.support_clients.find(:all)
    @puppies = @client.puppies.find(:all)
    @payments = @client.payments.find(:all)
    @charges = @client.charges.find(:all)    

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new
    @states = State.find(:all,:order=>"short_name")
    @genders = Gender.find(:all)
    @email_priorities = EmailPriority.find(:all)
    
    #set default gender to unknown
    @client.gender_id = Gender.where(:gender=>"Unknown")[0].id
    #set default email priority
    @client.email_priority_id = EmailPriority.where(:name=>"Normal")[0].id
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @states = State.find(:all,:order=>"short_name")
    @genders = Gender.find(:all)
    @email_priorities = EmailPriority.find(:all)
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])
    @states = State.find(:all,:order=>"short_name")
    @genders = Gender.find(:all)
    @email_priorities = EmailPriority.find(:all)
    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, :notice => 'Client was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])
    @states = State.find(:all,:order=>"short_name")
    @genders = Gender.find(:all)
    @email_priorities = EmailPriority.find(:all)
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to(@client, :notice => 'Client was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
    end
  end
end
