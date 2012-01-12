# == Schema Information
#
# Table name: clients
#
#  id                     :integer         not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  address_1              :string(255)
#  address_2              :string(255)
#  city                   :string(255)
#  state_id               :integer
#  zip                    :string(255)
#  email                  :string(255)
#  phone_number           :string(255)
#  secondary_phone_number :string(255)
#  gender_id              :integer
#  will_be_referal        :boolean         default(FALSE)
#  reference              :text
#  notes                  :text
#  email_priority_id      :integer
#  do_not_email           :boolean         default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
