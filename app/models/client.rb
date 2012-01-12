# == Schema Information
#
# Table name: clients
#
#  id                     :integer         not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  address_1              :string(255)
#  address_2              :string(255)
#  city                   :string(255)
#  state_id               :integer
#  zip                    :string(255)
#  email                  :string(255)
#  phone_number           :string(255)
#  secondary_phone_number :string(255)
#  gender_id              :integer
#  will_be_referal        :boolean         default(FALSE)
#  reference              :text
#  notes                  :text
#  email_priority_id      :integer
#  do_not_email           :boolean         default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

class Client < ActiveRecord::Base
	attr_accessible :first_name,:last_name,:address_1,:address_2,:city,:state_id,:zip,
	                :email,:phone_number,:secondary_phone_number,:gender_id,
					:will_be_referal,:reference,:notes,:email_priority_id,:do_not_email

  belongs_to :gender
	belongs_to :state
	belongs_to :email_priority

  before_destroy :check_for_children

	validates :last_name, :presence => true
	validates :email_priority_id, :presence => true
							 
	has_many :support_clients, :dependent => :delete_all
	has_many :puppies
	has_many :charges
	has_many :payments
  


  def full_name
	  return (first_name + " " + last_name)
  end
  
  
  def address_line_1
	return address_1
  end
  
  def address_line_2  
	if address_2.nil? or address_2.empty?
	  return city_state_zip
	else
	  return address_2
	end
  end
  
  def address_line_3
	if address_2.nil? or address_2.empty?
	  return ""
	else
	  return city_state_zip
	end
  end
  
  def city_state_zip
    s = ""
	city=""
	zip=""
	
	s = state.try(:short_name) if !state.nil?
	city = city if !city.nil?
	zip = zip if !zip.nil?
	
	return (city+" "+s+" "+zip) if (city.empty? or s.empty?) # no comma if don't have both
  	return (city+", "+s+" "+zip)
  end
	
  def do_not_email_display
  	if !do_not_email.nil? and do_not_email
		return "DO NOT EMAIL!"
	else
		return "Accepts emails."
	end
  end

  def will_be_referal_display
	if will_be_referal.nil? or !will_be_referal
		return "Is not a referral."
	else
		return "Is willing to be a referral."
	end
  end

    private

  def check_for_children

    if puppies.count > 0
      errors[:base] << "Cannot delete client while client owns a puppy."
      return false
    end
    if charges.count > 0
      errors[:base] << "Cannot delete client while client has charges."
      return false
    end
    if payments.count > 0
      errors[:base] << "Cannot delete client while client has payments."
      return false
    end
  end

end
