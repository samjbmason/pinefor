class GiftsController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_list, only: [:create, :update, :destroy]

  def create
    @gift = @list.gifts.new(gift_params)
    if @gift.save
      redirect_to @list, notice: 'You added a gift, awesome!'
    else
      redirect_to @list, alert: 'Woops you actually need to fill in the form'
    end
  end

  def update
    @gift = @list.gifts.find(params[:id])
    if @gift.update_attributes(gift_params)
      redirect_to @list, :notice => 'You updated your gift succesfully.'
    else
      redirect_to @list
    end
  end

  def destroy
    @list.gifts.find(params[:id]).destroy
    redirect_to @list, notice: 'You deleted your gift!'
  end

  def public_update
    @list = List.find_by public_hash: params[:public_hash]
    @gift = @list.gifts.find(params[:id])
    if @gift.user_id.nil?
      @gift.update(user_id: current_user.id)
      redirect_to public_list_path, notice: 'Yayy, your buying this gift.'
    else
      @gift.update(user_id: nil)
      redirect_to public_list_path, notice: 'Oh no, you seem to not be buying this gift anymore.'
    end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :price, :link)
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end
