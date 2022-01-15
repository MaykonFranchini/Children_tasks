class ChildrenController < ApplicationController
  before_action :authenticate_child!, except: [:show]

  def dashboard
    @child = Child.find(current_child.id)
    @pendingTasks = Task.where(child_id: current_child.id, status: 'pending')
    @notifications = Message.where("child_id = ? AND read =?", @child.id, false)
    @transactions = Transaction.where(account_id: @child).order(created_at: :desc)
  end

  def show
    @transaction = Transaction.new
    @task = Task.new
    @pendingTasks = Task.where(child_id: params[:id], status: 'pending')
    @child = Child.find(params[:id])
    @transactions = Transaction.where(child_id: @child)
  end
end
