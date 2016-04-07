class MatchesController < ApplicationController
  
  def index 
    #get matches for current_user 
    @matches = Matches.all
  end

  # def new
  # end

  # def create
  # end

  def show
    @match = Match.find(params[:id])
  end
end
