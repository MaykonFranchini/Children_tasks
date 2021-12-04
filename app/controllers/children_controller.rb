class ChildrenController < ApplicationController
  before_action :authenticate_child!

  def dashboard
    @child = Child.find(current_child.id)
  end
end
