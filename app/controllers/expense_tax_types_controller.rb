class ExpenseTaxTypesController < ApplicationController
  # GET /expense_tax_types
  # GET /expense_tax_types.xml
  def index
    @expense_tax_types = ExpenseTaxType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expense_tax_types }
    end
  end

  # GET /expense_tax_types/1
  # GET /expense_tax_types/1.xml
  def show
    @expense_tax_type = ExpenseTaxType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense_tax_type }
    end
  end

  # GET /expense_tax_types/new
  # GET /expense_tax_types/new.xml
  def new
    @expense_tax_type = ExpenseTaxType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense_tax_type }
    end
  end

  # GET /expense_tax_types/1/edit
  def edit
    @expense_tax_type = ExpenseTaxType.find(params[:id])
  end

  # POST /expense_tax_types
  # POST /expense_tax_types.xml
  def create
    @expense_tax_type = ExpenseTaxType.new(params[:expense_tax_type])

    respond_to do |format|
      if @expense_tax_type.save
        format.html { redirect_to(expense_tax_types_path, :notice => 'Expense tax type was successfully created.') }
        format.xml  { render :xml => @expense_tax_type, :status => :created, :location => @expense_tax_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense_tax_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expense_tax_types/1
  # PUT /expense_tax_types/1.xml
  def update
    @expense_tax_type = ExpenseTaxType.find(params[:id])

    respond_to do |format|
      if @expense_tax_type.update_attributes(params[:expense_tax_type])
        format.html { redirect_to(expense_tax_types_path, :notice => 'Expense tax type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expense_tax_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_tax_types/1
  # DELETE /expense_tax_types/1.xml
  def destroy
    @expense_tax_type = ExpenseTaxType.find(params[:id])
    @expense_tax_type.destroy

    respond_to do |format|
      format.html { redirect_to(expense_tax_types_url) }
      format.xml  { head :ok }
    end
  end
end
