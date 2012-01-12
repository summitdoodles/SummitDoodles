require "utils"

# == Schema Information
#
# Table name: weights
#
#  id         :integer         not null, primary key
#  date       :date
#  lb         :integer
#  oz         :integer
#  puppy_id   :integer
#  created_at :datetime
#  updated_at :datetime
#
class Weight < ActiveRecord::Base
  include Utils

  attr_accessible :date, :lb, :oz, :puppy_id

  validates :date, :presence => true
  validates :puppy_id, :presence => true
  validates :oz, :presence => true
  
  validates_numericality_of :oz,:lb
  
  belongs_to :puppy

  def age_sec
    age_sec = ((date - puppy.litter.birthday)* 24 * 60 * 60).to_i
  end

  def weight_as_decimal
    dec_oz = 0
    dec_oz = oz/16 unless oz.blank?
    return (lb + dec_oz)
  end

end
