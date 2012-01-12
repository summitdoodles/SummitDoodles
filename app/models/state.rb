# == Schema Information
#
# Table name: states
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base
  attr_accessible :name, :short_name

  has_many :clients

  before_destroy :check_for_children

  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
  validates :short_name, :presence => true,
                         :length   => { :maximum => 2 },
                         :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if clients.count > 0
      errors[:base] << "Cannot delete breed while a sire is using the breed."
      return false
    end
  end

end
