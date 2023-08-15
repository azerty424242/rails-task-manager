class TasksController < ApplicationController
  # 3. As a user, I can list tasks
  def index
    @tasks = Task.all
  end

  # 4. As a user, I can view the details of a task
  def show
    @task = Task.find(params[:id])
  end

  # 5 - As a user, I can add a new task
  def new
    @task = Task.new
  end

  # 5 - As a user, I can add a new task
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  # 6 - As a user, I can edit a task
  def edit
    @task = Task.find(params[:id])
  end

  # 6 - As a user, I can edit a task
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # 7 - As a user, I can delete a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end


=begin

5 - As a user, I can add a new task

The `new action` in the TasksController creates a new Task instance, and the
`new.html.erb` view displays the form to add a new task. When the form is submitted,
the `create action` in the TasksController handles the POST request, creates a new
task in the database, and redirects back to the list of tasks with a success notice.


=end
