class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.has_access?(current_user)
      redirect_to matches_path
    end
    @message = Message.new
    # @messages = @conversation.messages
  end

  def gather_messages
    @conversation = Conversation.find(params[:id])
    messages_array = @conversation.messages.reverse.map do |message|
        message_to_s = ""
        message_user = User.find(message.user_id)
        if message_user == current_user 
          message_to_s = "You: " + message.content
        else
          message_to_s = message_user.name + ": " + message.content
        end
      end 
    render json: {messages: messages_array}
  end

end

