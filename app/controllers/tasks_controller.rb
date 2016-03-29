class TasksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @tasks = Task.where(complete: [nil, false])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # JGZ - Could be cleaned up so you don't have to repeat this over and over
    # before_action :set_list, only: [:new,:edit,:create,:update,:destroy]
    # and then in your private area:
    # def set_list
    #   @list = List.find(params[:id])
    # end
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create!(task_param)

    redirect_to list_path(@list)
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id]).update(task_param)

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id]).destroy

    redirect_to list_path(@list)
  end


  private
  def task_param
    params.require(:task).permit(:name, :category, :priority, :description, :time_estimate, :time_actual, :cost, :deadline, :image, :quantity, :list_id, :complete)
  end


end
