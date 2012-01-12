class ReportsController < ApplicationController
	include ActionView::Helpers::NumberHelper
	
  # GET /reports/expense
  def expense
    
  	#choises for group by filter
    @group_filter_choices =  [["Litter","Litter"],
                        ["Expense Type","Expense Type"],
                        ["Name","Name"]                 
                        ]
    
                        
                        
    this_year = Date.today.year.to_s
    last_year = 1.year.ago.year.to_s
    two_years_ago = 2.years.ago.year.to_s  
    
                  
    @date_filter_choices =  [["All","all"],
	                         [this_year,"this_year"],
	                         [last_year,"last_year"],
	                         [two_years_ago,"two_years_ago"]                 
	                         ]
    
	year_filter = params[:expense_report_year_filter_selection]
	
	start_date = ""
	end_date = ""
	
  	if year_filter.eql?("all")
  		end_date = this_year+"-12-31"
  		start_date = "1600-01-01"
  	elsif year_filter.eql?("this_year")
  		end_date = this_year+"-12-31"
  		start_date = this_year+"-01-01"
    elsif year_filter.eql?("last_year")
    	end_date = last_year+"-12-31"
  		start_date = last_year+"-01-01"
    elsif year_filter.eql?("two_years_ago")
    	end_date = two_years_ago+"-12-31"
  		start_date = two_years_ago+"-01-01"
  	end
	             
  	table = Expense.report_table(:all,
  							 :conditions => ['date >= ? and date <= ?',start_date, end_date],
                             :only=>["date","name","amount"],
                             :include => {:expense_type=>{:only=>[:name]},
                                          :litter=>{:only=>[:birthday]}},
                             :order=>"date DESC" 
                            )

    if(table.blank?)
      @report_htm="No Results"
    else

      table.rename_column("date", "Date")
      table.rename_column("expense_type.name", "Expense Type")
      table.rename_column("name", "Name")
      table.rename_column("litter.birthday", "Litter")
      table.rename_column("amount", "Amount")

      grouping = Grouping(table, :by => params[:expense_report_group_filter_selection] )

      @report_htm=""
      grouping.each do |name, group|
        @report_htm = @report_htm + subHTM(group.to_html) +
                                    "Amount total->"+number_to_currency(group.sum("Amount"))+
                                    "<br><br><br>"
    end
	end
  

    respond_to do |format|
      format.html # index.html.erb
    end
  end
	
  private 
  
  #add a class to the HTM and other subs
  def subHTM(s)
  	s.sub!('<p>','<dev>')
  	s.sub!('</p>','</dev>')
  	s.sub!('<table>',"<table class='grayBorder'>")
  	return s
  end

  	
end
