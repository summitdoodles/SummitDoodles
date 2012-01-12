# == Schema Information
#
# Table name: expenses
#
#  id              :integer         not null, primary key
#  expense_type_id :integer
#  name            :string(255)
#  amount          :decimal(8, 2)
#  date            :date
#  litter_id       :integer
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Expense < ActiveRecord::Base
	attr_accessible :name,:expense_type_id,:amount,:date,:litter_id,:notes
	acts_as_reportable
	
	belongs_to :litter
	belongs_to :expense_type

  validates :expense_type_id, :presence => true
	validates :name, :presence => true
	validates :date, :presence => true

	validates :amount, :presence => true,
			  :numericality => true,
			  :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
end
