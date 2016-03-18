class TasksController < ApplicationController

  def index
    task = Task.all
  end

  def show
    task = Task.find(params[:id])
  end

  def new
    task = Task.new
  end

  def create
    task = Task.create!(task_param)

    redirct_to @list
  end

  private
  def task_param
    params.require(:task).permit(:name, :category, :priority, :description, :time_estimate, :time_actual, :costs, :deadline, :image, :quantity, :list_id)
  end


end
