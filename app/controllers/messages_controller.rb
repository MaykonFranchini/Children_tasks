class MessagesController < ApplicationController
  def update
    message = Message.find(params[:id])

    if message
      message.read = true
      message.save
      redirect_to child_root_path
    end
  end

  def clear_all_messages
    child = Child.find(params[:id])
    messages = Message.unread(child.id)

    if messages
      messages.each do |message|
        message.read = true
        message.save
      end
    end
    redirect_to child_root_path
  end
end
