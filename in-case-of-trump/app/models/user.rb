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

  validates :name, :gender, :dob, :preference, presence: true
  validates :email, uniqueness: true 

  def status
    (Citizen.find_by user_id: self.id) ? "Citizen" : "International"
  end

  def age
    Time.now.year - self.dob.year
  end

  def all_matches
    if self.status == 'International'
      match = Citizen.joins(:user).where('users.preference = ? AND users.gender = ?', self.gender, self.preference)
    else
      match = International.joins(:user).where('users.preference = ? AND users.gender = ?', self.gender, self.preference)
    end
    match.map {|match| match.user}  
  end  

end
