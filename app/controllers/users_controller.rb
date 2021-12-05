class UsersController < ApplicationController
    before_action :authenticate_user!

  def dashboard
    @transaction = Transaction.new
  @user = User.find(current_user.id)
  end
end
