class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_child
      @notifications = Message.unread(current_child.id)
    end

  end

  def selectlogin
  end
end
