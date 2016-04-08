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

class User < ActiveRecord::Base
  has_many :matches
  has_many :conversations, through: :matches

  def status
    (Citizen.find_by user_id: self.id) ? "Citizen" : "International"
  end

  def age
    Time.now.year - self.dob.year
  end

end
