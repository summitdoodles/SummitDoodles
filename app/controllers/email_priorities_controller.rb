class EmailPrioritiesController < ApplicationController
  # GET /email_priorities
  # GET /email_priorities.xml
  def index
    @email_priorities = EmailPriority.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /email_priorities/1
  # GET /email_priorities/1.xml
  def show
    @email_priority = EmailPriority.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /email_priorities/new
  # GET /email_priorities/new.xml
  def new
    @email_priority = EmailPriority.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /email_priorities/1/edit
  def edit
    @email_priority = EmailPriority.find(params[:id])
  end

  # POST /email_priorities
  # POST /email_priorities.xml
  def create
    @email_priority = EmailPriority.new(params[:email_priority])

    respond_to do |format|
      if @email_priority.save
        format.html { redirect_to(email_priorities_path, :notice => 'Email priority was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /email_priorities/1
  # PUT /email_priorities/1.xml
  def update
    @email_priority = EmailPriority.find(params[:id])

    respond_to do |format|
      if @email_priority.update_attributes(params[:email_priority])
        format.html { redirect_to(email_priorities_path, :notice => 'Email priority was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /email_priorities/1
  # DELETE /email_priorities/1.xml
  def destroy
    @email_priority = EmailPriority.find(params[:id])
    @email_priority.destroy

    respond_to do |format|
      format.html { redirect_to(email_priorities_path) }
      format.xml  { head :ok }
    end
  end
end
