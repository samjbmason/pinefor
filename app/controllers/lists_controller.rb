class ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists.all
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      redirect_to lists_url, alert: 'List was not created, try again.'
    end
  end

  def show
    @list = current_user.lists.find(params[:id])
    @gift = Gift.new
    @gifts = @list.gifts.all
  end

  def destroy
    current_user.lists.find(params[:id]).destroy
    redirect_to lists_url, notice: 'List was deleted.'

  end

  private
  def list_params
    params.require(:list).permit(:name, :natural_due_date)
  end
end
