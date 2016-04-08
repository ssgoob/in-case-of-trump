# == Schema Information
#
# Table name: matches
#
#  id               :integer          not null, primary key
#  status           :string
#  citizen_id       :integer
#  international_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Match < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :international
  has_one :conversation

  # all users currently in a conversation
  def self.conversing_users
    citizen_count = Citizen.joins(:matches).where('matches.status = "in_conversation"').group('citizens.id').count 
    international_count = International.joins(:matches).where('matches.status = "in_conversation"').group('internationals.id').count
    
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


end
