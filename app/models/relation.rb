# == Schema Information
#
# Table name: relations
#
#  id         :integer         not null, primary key
#  relation   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Relation < ActiveRecord::Base
  attr_accessible :relation

  has_many :support_clients

  before_destroy :check_for_children

  validates :relation, :presence => true,
                       :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if support_clients.count > 0
      errors[:base] << "Cannot delete relation while a relation uses it."
      return false
    end
  end
end
