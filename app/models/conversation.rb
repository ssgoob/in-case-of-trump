# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ActiveRecord::Base
  belongs_to :match
  has_many :messages

  
  def create_conversation
    Match.where(status == "Matched")
    Conversation.new()
  end

  def has_access?(current_user)
    if current_user.status == 'Citizen' && current_user.status_id == self.match.citizen_id 
      true
    elsif current_user.status == 'International' && current_user.status_id == self.match.international_id 
      true
    else
      false
    end  
  end


end
