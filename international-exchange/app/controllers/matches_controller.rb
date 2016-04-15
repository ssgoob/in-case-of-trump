class MatchesController < ApplicationController
  
  def index 
    @matches = current_user.order_matches_by_quality
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    @match = current_user.make_a_match(@user)
    @conversation_id = Conversation.find_by(match_id: @match.id).id if @match.status == 'Matched'
    # redirect_to @user
    render json: {match: @match, conversation_id: @conversation_id}
  end

  def show
    @match = Match.find(params[:id])
  end

end
