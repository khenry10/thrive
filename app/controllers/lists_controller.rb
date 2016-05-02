class ListsController < ApplicationController
  before_action :authenticate_user!, only:[:show, :new, :create]

  def index
    @lists = List.where(user_id: current_user)
    respond_to do |format|
    format.html
    format.json{ render json: @lists, status: :ok}
    end
  end

  def show
    @list = List.find(params[:id])
    # check_for_complete is a model method that filters for tasks that are complete: false or nil
    @tasks = @list.check_for_complete

    @task_aggregates = @list.aggregrate_tasks

    respond_to do |format|
      format.html
      format.json{ render json: @tasks, status: :ok}
    end

    @total_list_time = @list.aggregrate_tasks

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


    if params[:task_ids].present?
      @tasks = Task.find(params[:task_ids])

      @tasks.each do |task|
        task.update(complete: true)
      end
    end

    redirect_to @list
  end


  private
  def list_params
    params.require(:list).permit(:name, :list_type, :category, :list_time, :deadline, :deadline)
  end

end
