class MatchesController < ApplicationController
  
  def index 
    #get matches for current_user 
    # @matches = Match.all
    @user = User.find_by(name: "Benjamin")
    @matches = @user.all_matches
  end

  # def new
  # end

  # def create
  # end

  def show
    # @match = Match.find(params[:id])
  end
end
