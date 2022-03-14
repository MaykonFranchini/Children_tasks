class ChildrenController < ApplicationController
  before_action :authenticate_child!, except: [:show]

  def dashboard
    @child = Child.find(current_child.id)
    @pendingTasks = Task.pending_tasks(current_child.id)
    @notifications = Message.unread(@child.id)
    @transactions = Transaction.list(@child)
  end

  def show
    @transaction = Transaction.new
    @task = Task.new
    @pendingTasks = Task.pending_tasks(params[:id])
    @child = Child.find(params[:id])
    @transactions = Transaction.list(@child)
  end

end
