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

require 'test_helper'

class PuppyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
