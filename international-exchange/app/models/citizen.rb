# == Schema Information
#
# Table name: citizens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Citizen < ActiveRecord::Base
  has_many :matches
  has_many :conversations, through: :matches
  belongs_to :user
end
