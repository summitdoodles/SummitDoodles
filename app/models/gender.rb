# == Schema Information
#
# Table name: genders
#
#  id         :integer         not null, primary key
#  gender     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Gender < ActiveRecord::Base

  attr_accessible :gender

  has_many :puppies
  has_many :clients

  before_destroy :check_for_children

  validates :gender, :presence => true,
				     :length   => { :maximum => 50 },
				     :uniqueness => { :case_sensitive => false }

  def name
    return gender
  end

  private

  def check_for_children

    if puppies.count > 0
      errors[:base] << "Cannot delete gender while a puppy is using the gender."
      return false
    end
    if clients.count > 0
      errors[:base] << "Cannot delete gender while a client is using the gender."
      return false
    end
  end

end
