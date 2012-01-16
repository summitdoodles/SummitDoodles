# == Schema Information
#
# Table name: expense_tax_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExpenseTaxType < ActiveRecord::Base
	attr_accessible :name
  acts_as_reportable

  has_many :expense_types

  before_destroy :check_for_children

	validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if expense_types.count > 0
      errors[:base] << "Cannot delete tax type while a expense type is using the tax type."
      return false
    end
  end

end
