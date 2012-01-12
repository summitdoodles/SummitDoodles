# == Schema Information
#
# Table name: dames
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  birthday   :date
#  active     :boolean         default(FALSE)
#  breed_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Dame < ActiveRecord::Base
	attr_accessible :name,:birthday,:active,:breed_id

  belongs_to :breed
	has_many :litters

  before_destroy :check_for_children

	validates :name, :presence => true,
					 :length   => { :maximum => 50 }
	validates :breed_id, :presence => true

  private

  def check_for_children

    if litters.count > 0
      errors[:base] << "Cannot delete dame while dame has a litter."
      return false
    end
  end

end
