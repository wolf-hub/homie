class MessageMailer < ApplicationMailer
	default from: 'no-reply@homie.com'

	def new_message_email(message, conversation)
	    @message = Message.find(message);
	    @conversation = Conversation.find(conversation)
	    if @message.user == @conversation.sender
	    	@reciever = @conversation.recepient
	    else
	    	@reciever = @conversation.sender
	    end
	    mail(to: @reciever.email, subject: 'Your have recieved new message')
	end

end
