# == Schema Information
#
# Table name: support_clients
#
#  id          :integer         not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  phone       :string(255)
#  email       :string(255)
#  relation_id :integer
#  client_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SupportClient < ActiveRecord::Base
	attr_accessible :first_name,:last_name,:phone,:email,:relation_id,:client_id

	validates :last_name, :presence => true
	validates :client_id, :presence => true
  validates :relation_id, :presence => true
					 
	belongs_to :relation
	belongs_to :client

  def full_name
	  return (first_name + " " + last_name)
  end
end
