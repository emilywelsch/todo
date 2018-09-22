class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.name = params[:list][:name]
    @list.save
    redirect_to list_url(@list)
  end

  def delete # need to fix to be able to delete items from list
    @list = List.find(params[:id])
    @list.delete
    redirect_to index
  end

private

  def list_params
    params.require(:list).permit(:name)
  end

end
