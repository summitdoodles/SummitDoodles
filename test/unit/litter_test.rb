# == Schema Information
#
# Table name: litters
#
#  id         :integer         not null, primary key
#  birthday   :date
#  sire_id    :integer
#  dame_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class LitterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
