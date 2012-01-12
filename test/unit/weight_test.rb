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

require 'test_helper'

class WeightTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
