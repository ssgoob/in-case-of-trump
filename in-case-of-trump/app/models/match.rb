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
end
