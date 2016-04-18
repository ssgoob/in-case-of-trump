class CitizensController < ApplicationController
  
  def index
    @citizens = User.all.select {|user| user.status == 'Citizen'}
  end
end
