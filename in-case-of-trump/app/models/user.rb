class User < ActiveRecord::Base
  has_many :matches
  has_many :conversations, through: :matches
end
