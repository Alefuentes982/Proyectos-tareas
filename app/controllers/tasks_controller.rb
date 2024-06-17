class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def show; end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: 'Tarea creada exitosamente'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @project, notice: 'Tarea Actualizada exitosamente'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @project, notice: 'Tarea eliminada'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
