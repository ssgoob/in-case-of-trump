class Citizen < ActiveRecord::Base
  belongs_to :user
end
