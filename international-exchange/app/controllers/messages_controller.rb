class MessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:message][:conversation_id])
    @conversation.messages << Message.create(mes_params)
    render json: {messages: @conversation.messages.reverse}
  end


  private

      def mes_params
        params.require(:message).permit(:content, :conversation_id, :user_id)
      end  

end

