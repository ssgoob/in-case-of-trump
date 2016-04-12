class MatchesController < ApplicationController
  
  def index 
    @matches = current_user.potential_matches
  end

  def new
  end

  def create
  end

  def show
    @match = Match.find(params[:id])
  end
end
