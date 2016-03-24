class ListsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @lists = List.where(user_id: current_user)
  end

  def show
    authenticate_user!
    @list = List.find(params[:id])
    @tasks = @list.check_for_complete
    # @total_list_time = @list.add_tasks_time
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params.merge(user: current_user))

    redirect_to @list
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id]).update(list_params)

    redirect_to list_path
  end

  def destroy
    @list = List.find(params[:id]).destroy
    if @list.user == current_user
      @list.destroy
    else
      flash[:alert] = "Sorry you can only delete lists that you created"
    end
    redirect_to lists_path
  end

  def completed_task
    @list = List.find(params[:id])

    if params[:task_id].present?
      @task = Task.find(params[:task_id])

      @task.update(complete: true)
    end

    redirect_to @list
  end


  private
  def list_params
    params.require(:list).permit(:name, :list_type, :category, :list_time, :deadline, :deadline)
  end

end
