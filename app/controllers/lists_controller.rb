class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      redirect_to lists_url, alert: 'List was not created, try again.'
    end
  end

  def show
    @list = List.find(params[:id])
    @gift = Gift.new
    @gifts = @list.gifts.all
  end

  private
  def list_params
    params.require(:list).permit(:name, :natural_due_date)
  end
end
