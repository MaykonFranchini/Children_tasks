class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to child_path(@task.child_id)
    else
    render :new
    end
  end

  def update
    task = Task.find(params[:id])

    if task
      task.status = 'completed'
      task.save
      redirect_to child_path(task.child_id)
    end
  end

  private
  def task_params
      params.require(:task).permit(:title, :child_id)
    end
end

