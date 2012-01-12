# == Schema Information
#
# Table name: charges
#
#  id             :integer         not null, primary key
#  date           :date
#  amount         :decimal(8, 2)
#  charge_type_id :integer
#  puppy_id       :integer
#  client_id      :integer
#  notes          :text
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
