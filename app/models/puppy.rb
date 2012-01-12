# == Schema Information
#
# Table name: puppies
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  gender_id         :integer
#  color_id          :integer
#  date_sold         :date
#  litter_id         :integer
#  collar_color_name :string(255)
#  client_id         :integer
#  notes             :text
#  created_at        :datetime
#  updated_at        :datetime
#


class Puppy < ActiveRecord::Base
  attr_accessible :name,:gender_id,:color_id,:date_sold,:litter_id,:collar_color_name,:client_id,:notes

  has_many :weights
  has_many :charges

  belongs_to :color
  belongs_to :gender
  belongs_to :litter
  belongs_to :client

  before_destroy :check_for_children

  validates :name, :presence => true
  validates :gender_id, :presence => true
  validates :color_id, :presence => true
  validates :litter_id, :presence => true

  def name_with_collar_color
    return ( name + "("+collar_color_name+")" )
  end

  def name_with_collar_color_and_litter
    return ( name + "("+collar_color_name+") - "+litter.birthday.to_s )
  end

  def newest_weight
    w_desc = weights.order(" date DESC")
    return w_desc[0] if !w_desc.nil?
    return nil
  end

  private

  def check_for_children

    if charges.count > 0
      errors[:base] << "Cannot delete puppy while a charge is assigned to the puppy."
      return false
    end
    if weights.count > 0
      errors[:base] << "Cannot delete puppy while it has weights."
      return false
    end
  end

end
