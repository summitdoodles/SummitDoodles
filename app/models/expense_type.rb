# == Schema Information
#
# Table name: expense_types
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  expense_tax_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class ExpenseType < ActiveRecord::Base
	attr_accessible :name,:expense_tax_type_id
	acts_as_reportable

  has_many :expenses
	belongs_to :expense_tax_type

  before_destroy :check_for_children

	validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if expenses.count > 0
      errors[:base] << "Cannot delete breed while a sire is using the breed."
      return false
    end
  end

end
