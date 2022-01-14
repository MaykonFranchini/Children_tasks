class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save

      child = @task.child_id
      if Notification.find(child).blank?
        notification = Notification.create(child_id: child)
      else
        notification = Notification.find(child)
      end

      message = Message.new(child_id: child, notification_id: notification.id, content: "New task. #{@task.title.capitalize}.")
      if message.save
        redirect_to child_path(@task.child_id)
      end
    else
    render :new
    end



  end

  def update
    task = Task.find(params[:id])

    if task
      task.status = 'completed'
      task.save
      redirect_to child_root_path
    end
  end

  private
  def task_params
      params.require(:task).permit(:title, :child_id)
    end
end

