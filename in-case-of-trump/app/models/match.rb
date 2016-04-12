class Match < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :international
  has_one :conversation

  def self.conversing_users
    citizen_count = Citizen.joins(:matches).where('matches.status = "Matched"').group('citizens.id').count 
    international_count = International.joins(:matches).where('matches.status = "Matched"').group('internationals.id').count
    
    if citizen_count.class != Fixnum
      citizen_count = 0
    end
    
    if international_count.class != Fixnum
      international_count = 0
    end
    
    return citizen_count + international_count
  end

  def self.success_rate
    conversing_users / User.all.count
  end

  def self.failure_rate
    1 - success_rate
  end

  # def self.match_exist(citizen_id, international_id)
  #   Match.where("citizen_id = ? AND international_id = ?", citizen_id, international_id)
  # end

  def self.match_exist(first_user, second_user)
    binding.pry
    if(first_user.status == 'Citizen')
      Match.where("citizen_id = ? AND international_id = ?", first_user.status_id, second_user.status_id)
    else
      Match.where("citizen_id = ? AND international_id = ?", second_user.status_id, first_user.status_id)
    end
  end

  def display_option(user_status)
    if(self.status.chars.last == user_status.downcase.chars.first) #status is pending and waiting on you
      return 'like'
    elsif(self.status.start_with?('pending')) #waiting on other user
      return 'disabled'
    else #status is matched
      return 'conversation'
    end
  end

end
