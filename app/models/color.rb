# == Schema Information
#
# Table name: colors
#
#  id         :integer         not null, primary key
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Color < ActiveRecord::Base
  attr_accessible :color

  has_many :puppies

  before_destroy :check_for_children

  validates :color, :presence => true

  def name
    return color
  end

    private

  def check_for_children

    if puppies.count > 0
      errors[:base] << "Cannot delete color while color is being used by a puppy."
      return false
    end
  end

end
