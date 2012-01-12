# == Schema Information
#
# Table name: email_priorities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EmailPriority < ActiveRecord::Base
  
  attr_accessible :name  
  
  has_many :clients

  before_destroy :check_for_children

  validates :name, :presence => true,
				   :uniqueness => { :case_sensitive => false }

  private

  def check_for_children

    if clients.count > 0
      errors[:base] << "Cannot delete email priority while a client is using the email priority."
      return false
    end
  end

end
