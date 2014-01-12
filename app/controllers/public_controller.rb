class PublicController < ApplicationController

  def show
    @list = List.find_by url: params[:id]

    # Checks if user is logged in and if not shows login form then checks if they own the list they are trying to view
    if !user_signed_in?
      render :login
    elsif current_user == @list.user
        render :owns_list
    end
  end

end
