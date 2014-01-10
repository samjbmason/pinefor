class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new

  end

  private
  def list_params
    params.require(:list).permit(:name, :date, :url)
  end
end
