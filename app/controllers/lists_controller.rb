class ListsController < ApplicationController

  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)

    redirect_to @list
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id]).update(list_params)

    redirect_to list_path
  end

  private
  def list_params
    params.require(:list).permit(:name, :list_type, :category, :list_time, :deadline, :deadline)
  end

end
