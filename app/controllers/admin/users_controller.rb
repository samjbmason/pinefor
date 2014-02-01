class Admin::UsersController < ApplicationController
  before_filter :authorise_admin

  def destroy
    @user = User.find(params[:id])
    unless @user.admin
      @user.destroy
      redirect_to admin_path, notice: "User has been deleted"
    else
      redirect_to admin_path, alert: "You can't delete an admin!"
    end

  end

  private
  def authorise_admin
    redirect_to root_path if current_user.nil? || current_user.admin == false
  end
end
