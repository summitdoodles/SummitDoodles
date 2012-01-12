# == Schema Information
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  date       :date
#  amount     :decimal(8, 2)
#  client_id  :integer
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
