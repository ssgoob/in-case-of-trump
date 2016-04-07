class Conversation < ActiveRecord::Base
  belongs_to :match
  has_many :messages
end
