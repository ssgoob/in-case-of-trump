class MessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:message][:conversation_id])
    @conversation.messages << Message.create(mes_params)
      messages_array = @conversation.messages.reverse.map do |message|
        message_to_s = ""
        message_user = User.find(message.user_id)
        if message_user == current_user 
          message_to_s = message.created_at.to_datetime.strftime('%r') + "<br>You: " + message.content
        else
          message_to_s = message.created_at.to_datetime.strftime('%r') + "<br>" + message_user.name + ": " + message.content
        end
      end 
    render json: {messages: messages_array}
  end


  private

      def mes_params
        params.require(:message).permit(:content, :conversation_id, :user_id)
      end  

end

