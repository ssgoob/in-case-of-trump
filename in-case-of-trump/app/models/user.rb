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

  def status
    (Citizen.find_by user_id: self.id) ? "Citizen" : "International"
  end

  def status_id
    if self.status == "Citizen"
      Citizen.where("citizens.user_id = ?", self.id)[0].id
    else
      International.where("internationals.user_id = ?", self.id)[0].id
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

  def make_a_match(matchee)
    if self.status == "Citizen"
      citizen_id = self.status_id
      international_id = matchee.status_id
        match = Match.match_exist(citizen_id, international_id)
        if match.present? && match.status == "pending c"
          match.status == "Matched"
          match.save
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "pending i")
        end
    else
      citizen_id = matchee.status_id
      international_id = self.status_id
        match = Match.match_exist(citizen_id, international_id)
        if match.present? && match.status == "pending i"
          match.status == "Matched"
          match.save
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "pending c")
        end


    # (citizen_id: self.status_id, :international_id: )
    end
  end

  # a citizen likes an international
  # the international gets added to the citizen's likes array
  # we look at the itnerational's likes array to see if there is overlap
  # if there is, a match is created that includes both of them



   

end
