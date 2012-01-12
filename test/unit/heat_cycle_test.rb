# == Schema Information
#
# Table name: heat_cycles
#
#  id         :integer         not null, primary key
#  date       :date
#  dame_id    :integer
#  in_heat    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class HeatCycleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
