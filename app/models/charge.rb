# == Schema Information
#
# Table name: charges
#
#  id             :integer         not null, primary key
#  date           :date
#  amount         :decimal(8, 2)
#  charge_type_id :integer
#  puppy_id       :integer
#  client_id      :integer
#  notes          :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Charge < ActiveRecord::Base
  attr_accessible :date, :amount, :charge_type_id, :puppy_id, :client_id, :notes

  belongs_to :client
  belongs_to :charge_type
  belongs_to :puppy

  validates :date, :presence => true
  validates :charge_type_id, :presence => true

  validates :amount, :presence => true,
			  :numericality => true,
			  :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }

end
