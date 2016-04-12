class User < ActiveRecord::Base
  has_secure_password 
  
  has_many :user_interests
  has_many :interests, through: :user_interests

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  
  # validates :name, :gender, :dob, :status, :preference, presence: true
  # validates :email, uniqueness: true 

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

  def citizen
    if self.status == "Citizen"
      Citizen.where("citizens.user_id = ?", self.id)[0]
    end
  end

  def international
    if self.status == "International"
      International.where("internationals.user_id = ?", self.id)[0]
    end
  end
  
  def age
    ((Time.now - self.dob)/3600/24/365).to_i
  end

  def potential_matches
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
        match = Match.match_exist(self, matchee)
        if match.present? && match[0].status == "pending c"
          match[0].status = "Matched"
          match[0].save
          Conversation.create(match_id: match[0].id)
          match[0]
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "pending i")
        end
    else  
      citizen_id = matchee.status_id
      international_id = self.status_id
        match = Match.match_exist(self, matchee)
        if match.present? && match[0].status == "pending i"
          match[0].status = "Matched"
          match[0].save
          Conversation.create(match_id: match[0].id)
          match[0]
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "pending c")
        end
    end
  end

  def matched
    if self.status == "International"
      Match.where("international_id = ? AND status= ?", self.status_id, "Matched")
    else
      Match.where("citizen_id = ? AND status= ?", self.status_id, "Matched")
    end
  end

  def has_access?(user)
    (self == user || self.potential_matches.include?(user)) ? true : false
  end

  # a citizen likes an international
  # the international gets added to the citizen's likes array
  # we look at the itnerational's likes array to see if there is overlap
  # if there is, a match is created that includes both of them

end