class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@conversations = Conversation.involving(current_user)
  end

  def create
  	if Conversation.between(params[:sender_id], params[:recepient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recepient_id]).first
    else
      @conversation = Conversation.create(sender_id: params[:sender_id], recepient_id: params[:recepient_id])
      
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private

    def conversation_params
      params.require(:conversation).permit(:sender_id, :recepient_id)
    end
end
