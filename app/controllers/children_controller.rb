class ChildrenController < ApplicationController
  before_action :authenticate_child!, except: [:show]

  def dashboard
    @child = Child.find(current_child.id)
    @pendingTasks = Task.where(child_id: current_child.id, status: 'pending')
    # @account = Account.find(child_id: current_child.id) || Account.create(@child)
    @notifications = Notification.where(child_id: @child)
  end

  def show
    @transaction = Transaction.new
    @task = Task.new
    @pendingTasks = Task.where(child_id: params[:id], status: 'pending')
    @child = Child.find(params[:id])
  end
end
