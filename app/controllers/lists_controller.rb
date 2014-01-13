class ListsController < ApplicationController
  before_filter :authenticate_user!, except: :shared

  # Shows all logged in user lists
  def index
    @lists = current_user.lists.all
    @list = List.new
  end

  # Creates list or redirect back to index page if invalid
  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      redirect_to lists_url, alert: 'List was not created, try again.'
    end
  end

  # Show individual list GET'/list/#id'
  def show
    @list = current_user.lists.find(params[:id])
    @gift = Gift.new
    @gifts = @list.gifts.all
  end

  # Delete list
  def destroy
    current_user.lists.find(params[:id]).destroy
    redirect_to lists_url, notice: 'List was deleted.'
  end

  # Shared List action for public views
  def shared
    @list = List.find_by shared_key: params[:shared_key]

    # Checks if user is logged in and if not shows login form then checks if they own the list they are trying to view
    if !user_signed_in?
      render 'shared_views/login'
    elsif current_user == @list.user
        render 'shared_views/owns_list'
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :natural_due_date)
  end
end
