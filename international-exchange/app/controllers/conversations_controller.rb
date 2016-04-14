class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.has_access?(current_user)
      redirect_to matches_path
    end
    @message = Message.new
    @messages = @conversation.messages.reverse
  end

  def gather_messages
    @conversation = Conversation.find(params[:id])
    # message_content_w_name = @conversation.messages.map do |
    render json: @conversation.messages.reverse
  end

end