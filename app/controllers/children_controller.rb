class ChildrenController < ApplicationController
  before_action :authenticate_child!, except: [:show]

  def dashboard
    @child = Child.find(current_child.id)
    @pendingTasks = Task.pending_tasks(current_child.id)
    @notifications = Message.unread(@child.id)
    @pagy, @transactions = pagy(Transaction.list(@child), items: 5)

  end

  def show
    @transaction = Transaction.new
    @task = Task.new
    @pendingTasks = Task.pending_tasks(params[:id])
    @child = Child.find(params[:id])
    @pagy, @transactions = pagy(Transaction.list(@child), items: 5)

  end

end
