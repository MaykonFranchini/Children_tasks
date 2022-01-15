class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_child
      @notifications = Message.where("child_id = ? AND read =?", current_child.id, false)
    end

  end

  def selectlogin
  end
end
