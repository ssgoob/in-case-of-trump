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
    binding.pry
    Match.where(status == "Matched")
  end

end
