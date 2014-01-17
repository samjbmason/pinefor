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

  # Update List details
  def update
    @list = current_user.lists.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(list_params)
        format.html { redirect_to @list, :notice => 'User was successfully updated.' }
        format.json { respond_with_bip(@list) }
      else
        format.html { render :show }
        format.json { respond_with_bip(@list) }
      end
    end
  end

  # Delete list
  def destroy
    current_user.lists.find(params[:id]).destroy
    redirect_to lists_path, notice: 'List was deleted.'
  end

  # Shared List action for public views
  def public
    @list = List.find_by public_hash: params[:public_hash]
  end

  private
  def list_params
    params.require(:list).permit(:name, :natural_due_date)
  end
end
