class Admin::DashboardController < ApplicationController
  before_filter :authorise_admin

  def index
    if params[:user_email].present?
      @users = User.where("email = :user_email", {user_email: params[:user_email]})
    end

    @user_count = User.count
    @latest_user = User.last
  end

  private
  def authorise_admin
    redirect_to root_path if current_user.nil? || current_user.admin == false
  end
end
