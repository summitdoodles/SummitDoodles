# == Schema Information
#
# Table name: dames
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  birthday   :date
#  active     :boolean         default(FALSE)
#  breed_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class DameTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
