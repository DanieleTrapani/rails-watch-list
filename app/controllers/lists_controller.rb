class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    redirect_to lists_path if @list.save
  end

  private

  def list_params
    require(:list).permit(:name)
  end
end
