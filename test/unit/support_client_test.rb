# == Schema Information
#
# Table name: support_clients
#
#  id          :integer         not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  phone       :string(255)
#  email       :string(255)
#  relation_id :integer
#  client_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class SupportClientTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
