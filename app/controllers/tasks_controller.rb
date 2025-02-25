class TasksController < ApplicationController
    def index
      @incomplete_tasks = Task.incomplete
      @complete_tasks = Task.complete
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = 'incomplete'
      if @task.save
        redirect_to tasks_path
      else
        render :index
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: 'complete')
      redirect_to tasks_path
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path, notice: "Task was successfully deleted."
      end
      
  
    private
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
  