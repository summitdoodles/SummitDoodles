# == Schema Information
#
# Table name: charge_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ChargeType < ActiveRecord::Base
  attr_accessible :name

  has_many :charges

  before_destroy :check_for_children

  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if charges.count > 0
      errors[:base] << "Cannot delete charge type while a charge is using the charge type."
      return false
    end

  end
end
