class ChildrenController < ApplicationController
  before_action :authenticate_child!

  def dashboard
    @child = Child.find(current_child.id)
    # @account = Account.find(child_id: current_child.id) || Account.create(@child)
  end
end
