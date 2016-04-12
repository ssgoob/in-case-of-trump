class MatchesController < ApplicationController
  
  def index 
    @matches = current_user.potential_matches
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    current_user.make_a_match(@user)
    redirect_to root_path
  end

  def show
    @match = Match.find(params[:id])
  end
end
