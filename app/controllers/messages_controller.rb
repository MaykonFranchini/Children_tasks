class MessagesController < ApplicationController
  def update
    message = Message.find(params[:id])

    if message
      message.read = true
      message.save
      redirect_to child_root_path
    end
  end
end
