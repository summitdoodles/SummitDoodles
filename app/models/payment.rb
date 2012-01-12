# == Schema Information
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  date       :date
#  amount     :decimal(8, 2)
#  client_id  :integer
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Payment < ActiveRecord::Base
  attr_accessible :date,:amount,:client_id,:notes

  validates :date, :presence => true
  validates :client_id, :presence => true

  validates :amount, :presence => true,
			  :numericality => true,
			  :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }

  belongs_to :client
end
