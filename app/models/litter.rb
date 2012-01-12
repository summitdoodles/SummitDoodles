# == Schema Information
#
# Table name: litters
#
#  id         :integer         not null, primary key
#  birthday   :date
#  sire_id    :integer
#  dame_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Litter < ActiveRecord::Base
  attr_accessible :birthday,:sire_id,:dame_id
  acts_as_reportable

  has_many :puppies
  belongs_to :sire
  belongs_to :dame

  before_destroy :check_for_children

  validates :birthday, :presence => true
  validates :sire_id, :presence => true
  validates :dame_id, :presence => true

  def name    
    return (birthday.to_default_s + " " + sire.name + "/" + dame.name)
  end

  private

  def check_for_children

    if puppies.count > 0
      errors[:base] << "Cannot delete litter while a puppy is assigned to it."
      return false
    end
  end
  
end
