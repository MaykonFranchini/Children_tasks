class UsersController < ApplicationController
    before_action :authenticate_user!, :find_user

  def dashboard
  end

  def profile
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

end
