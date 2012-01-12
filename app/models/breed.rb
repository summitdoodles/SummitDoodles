# == Schema Information
#
# Table name: breeds
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Breed < ActiveRecord::Base
  attr_accessible :name

  has_many :sires
  has_many :dames

  before_destroy :check_for_children
  
  validates :name, :presence => true,
		               :length   => { :maximum => 50 },
			             :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if sires.count > 0
      errors[:base] << "Cannot delete breed while a sire is using the breed."
      return false
    end
    if dames.count > 0
      errors[:base] << "Cannot delete breed while a dame is using the breed."
      return false
    end
  end
end
