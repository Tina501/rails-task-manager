class TasksController < ApplicationController
  # Display all tasks
  def index
    @tasks = Task.all
  end

  # Display a specific task's details
  def show
    @task = Task.find(params[:id])
  end

  # Render the new task form
  def new
    @task = Task.new
  end

  # Create a new task
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # Render the edit task form
  def edit
    @task = Task.find(params[:id])
  end

  # Update an existing task
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # Delete a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  private

  # Strong parameters for task creation and update
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
