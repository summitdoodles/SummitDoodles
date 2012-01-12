# == Schema Information
#
# Table name: expenses
#
#  id              :integer         not null, primary key
#  expense_type_id :integer
#  name            :string(255)
#  amount          :decimal(8, 2)
#  date            :date
#  litter_id       :integer
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
