class MatchesController < ApplicationController
  
  def index 
    @matches = current_user.order_matches_by_quality
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    @match = current_user.make_a_match(@user)
    # redirect_to @user
    render json: {match: @match}
  end

  def show
    @match = Match.find(params[:id])
  end
end
