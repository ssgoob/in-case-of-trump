class Match < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :international
end
