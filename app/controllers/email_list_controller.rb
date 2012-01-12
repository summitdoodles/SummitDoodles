class EmailListController < ApplicationController
  def index
    @email_priority = EmailPriority.find(:all)    
    @email_list_filter = EmailListFilter.new
    
    if !params[:email_list_filter].nil?        
        @email_list_filter.email_priority_id = params[:email_list_filter][:email_priority_id]
        @email_list_filter.email_own_puppy = params[:email_list_filter][:email_own_puppy]
    else
        @email_list_filter.email_priority_id = ""
        @email_list_filter.email_own_puppy = ""
    end
    
    h_where={}
    #never bring back email address when 'do not email' is checked
    h_where["do_not_email"] = false
    
    if !@email_list_filter.email_priority_id.empty?
        h_where["email_priority_id"] = @email_list_filter.email_priority_id
    end
    
    clients = Client.where(h_where).where("email IS NOT NULL")
    @email_list=""
    
    if @email_list_filter.email_own_puppy.empty?    
        set_email_list(clients)
    elsif @email_list_filter.email_own_puppy.eql?('yes')
      clients.each do |c|
        add_client_to_list(c) if !c.puppies.blank?
      end
    elsif @email_list_filter.email_own_puppy.eql?('no')
      clients.each do |c|
        add_client_to_list(c) if c.puppies.blank?
      end
    else
      #ERROR, should never get here
    end
    
  end
  
  private
  
  def set_email_list (clients)
    clients.each do |c|
      add_client_to_list(c)
    end
  end
  
  def add_client_to_list(client)
      @email_list += (client.full_name + " <" + client.email+">, ")
  end
end
