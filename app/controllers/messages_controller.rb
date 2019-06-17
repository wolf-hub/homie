class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    
    if current_user == @conversation.sender || current_user == @conversation.recepient
      @other = current_user == @conversation.sender ? @conversation.recepient : @conversation.sender
      @messages = @conversation.messages.order("created_at ASC")
      @conversations = Conversation.involving(current_user)
    else
      redirect_to conversations_path, alert: "You don't have permission to view this."
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at ASC")

    if @message.save      
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private   

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:context, :user_id)
    end
end