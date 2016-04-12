class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.has_access?(current_user)
      redirect_to matches_path
    end
    @message = @conversation.messages.build
  end

end