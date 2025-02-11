require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def index
    @tasks = Task.all
  end
  # Action to show a single task
  def show
    @task = Task.find(params[:id])
  end

  # Action to create a new task (render new form)
  def new
    @task = Task.new
  end

  # Action to handle task creation
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  # Action to edit a task (render edit form)
  def edit
    @task = Task.find(params[:id])
  end

  # Action to handle task update
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  # Action to delete a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully destroyed."
  end

  private

  # Strong parameters to allow specific task fields
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
