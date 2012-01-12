# == Schema Information
#
# Table name: expense_types
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  expense_tax_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class ExpenseTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
