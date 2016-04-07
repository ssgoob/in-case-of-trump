# == Schema Information
#
# Table name: internationals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class International < ActiveRecord::Base
  belongs_to :user
end
