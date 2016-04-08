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
  attr_accessor :likes
  has_many :matches
  has_many :conversations, through: :matches

  def initialize(*args) # &block
    super
    @likes = []
  end

  def status
    (Citizen.find_by user_id: self.id) ? "Citizen" : "International"
  end

  def status_id
    if self.status == "Citizen"
      Citizen.find_by(self.id)
    else
      International.find_by(self.id)
    end
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

  # the view will display matches accrording to all_matches criteria
  def pick_a_match(match)
     @likes.push(match)
    return self.likes
  end

  def make_a_match(user)
    match = Match.new(citizen_id: self.status_id, )
  end

  # a citizen likes an international
  # the international gets added to the citizen's likes array
  # we look at the itnerational's likes array to see if there is overlap
  # if there is, a match is created that includes both of them



   

end
