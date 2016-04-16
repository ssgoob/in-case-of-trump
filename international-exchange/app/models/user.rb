class User < ActiveRecord::Base
  has_secure_password 
  # extend Geocoder::Model::ActiveRecord

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  reverse_geocoded_by  :latitude, :longitude, :address => :location
  after_validation :reverse_geocode

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
    rejected_users = self.blocked_users
    if self.status == 'International'
      matches = Citizen.joins(:user).where('users.preference = ? AND users.gender = ?', self.gender, self.preference)
      matches.reject do |match|
        rejected_users.include?(match.id)
      end  
    else
      matches = International.joins(:user).where('users.preference = ? AND users.gender = ?', self.gender, self.preference)  
    end
    matches.reject { |match| rejected_users.include?(match.id) }.map {|match| match.user}
  end  

  def age_preference
    matches = self.potential_matches
    matches.select do |match|
      match.age >= self.minage && match.age <= self.maxage  && self.age >= match.minage && self.age <= maxage
    end
  end


  def order_matches_by_quality
    users = self.age_preference

    matchees = users.map do |matchee|
      [matchee, self.calculate_quality(matchee)]
    end
    sorted_matchees = matchees.sort_by do |matchee_info|
      matchee_info[1]*-1
    end
    sorted_matchees
  end

  def calculate_quality(user)
    my_interests = UserInterest.where(user_id: self.id)
    matchee_interests = UserInterest.where(user_id: user.id)
    match_score = 0;
    Interest.all.each do |interest|
      my_rating = my_interests.where(interest_id: interest.id).pluck(:rating)[0]
      my_rating ||= 3
      matchee_rating = matchee_interests.where(interest_id: interest.id).pluck(:rating)[0]
      matchee_rating ||= 3
      match_score += [my_rating, matchee_rating].min - [my_rating, matchee_rating].max
    end
    match_score
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

  def block(matchee)
    if self.status == "Citizen"
      citizen_id = self.status_id
      international_id = matchee.status_id
        match = Match.match_exist(self, matchee)
        if match.present?
          match[0].status = "Blocked"
          match[0].save
          match[0]
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "Blocked")
        end
    else 
      citizen_id = matchee.status_id
      international_id = self.status_id
        match = Match.match_exist(self, matchee)
        if match.present?
          match[0].status = "Blocked"
          match[0].save
          match[0]
        elsif !match.present? 
          Match.create(citizen_id: citizen_id, international_id: international_id, status: "Blocked")
        end
    end    
  end  

  def blocked_users
    if self.status == "International"
      Match.where("international_id = ? AND status= ?", self.status_id, "Blocked").pluck(:citizen_id)
    else
      Match.where("citizen_id = ? AND status= ?", self.status_id, "Blocked").pluck(:international_id)
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

  def abbrev_address
    if self.location != nil
      address = self.location.split(",")
      address.shift
      address.join.gsub(/[^a-zA-Z]/, ' ').strip
    end
  end





  # a citizen likes an international
  # the international gets added to the citizen's likes array
  # we look at the itnerational's likes array to see if there is overlap
  # if there is, a match is created that includes both of them

end