class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
  end

  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.sender_id == current_user.id || @conversation.recipient_id == current_user.id
      redirect_to conversations_path, alert: "You are not authorized to view this conversation."
    end
  end

  def create
    recipient = User.find(params[:conversation][:recipient_id])
    @conversation = Conversation.between(current_user.id, recipient.id).first_or_create!(sender: current_user, recipient: recipient)

    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:recipient_id)
  end
end
