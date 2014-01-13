class GiftsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @gift = @list.gifts.new(gift_params)
    if @gift.save
      redirect_to @list, notice: 'Gift was successfully added.'
    else
      redirect_to @list, alert: 'Gift was not created, try again.'
    end
  end

  def update
    @list = List.find_by shared_key: params[:shared_key]
    @gift = @list.gifts.find(params[:id])
    if @gift.update(user_id: current_user.id)

      redirect_to shared_path
    end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :price, :link)
  end

end
