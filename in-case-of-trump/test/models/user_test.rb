# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  gender     :string
#  dob        :datetime
#  location   :string
#  preference :string
#  interests  :string
#  photos     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
