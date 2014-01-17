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
    @list = List.find(params[:list_id])
    @gift = @list.gifts.find(params[:id])
    respond_to do |format|
      if @gift.update_attributes(gift_params)
        format.html { redirect_to @list, :notice => 'Gift was successfully updated.' }
        format.json { respond_with_bip(@gift) }
      else
        format.html { redirect_to @list }
        format.json { respond_with_bip(@gift) }
      end
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.gifts.find(params[:id]).destroy
    redirect_to @list, notice: 'List was deleted.'
  end

  def public_update
    @list = List.find_by public_hash: params[:public_hash]
    @gift = @list.gifts.find(params[:id])
    if @gift.user_id.nil?
      @gift.update(user_id: current_user.id)
      redirect_to public_list_path, notice: 'Your buying this gift.'
    else
      @gift.update(user_id: nil)
      redirect_to public_list_path, notice: 'Your not buying this gift anymore.'
    end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :price, :link)
  end

end
