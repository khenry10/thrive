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

  private
  def list_params
    params.require(:list).permit(:name, :list_type, :category, :list_time, :deadline, :deadline)
  end

end
