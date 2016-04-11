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

  # if Match status is 'success', create conversation using match_id
  def create_conversation
    Match.where(status == "Matched")
    Conversation.new()
  end

# 1. If a user makes a match and that match's status is "Matched"
# 2. Create a new conversation with a match id that is same as the match's id
# 3. Return a conversation


  # match.create_conversation
  #   Match.where(status == "Matched")
  #   Conversation.new(match_id = self.id)    


end
