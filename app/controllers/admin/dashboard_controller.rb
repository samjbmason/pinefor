class Admin::DashboardController < ApplicationController
  before_filter :authorise_admin

  def index
    if params[:user_email].present?
      @users = User.where("email = :user_email", {user_email: params[:user_email]})
    end

    @user = User
    @current_user_count = @user.count
    @newest_user = @user.last

    # Creates empty array that matches number of marks on chart
    value_array = Array.new(8).fill(0)
    # Fetches 8 metric records and order them old -> new
    @all_user_counts = Metric.user_count.order(:created_at).limit(8).where("created_at < ?", Time.now)
    # Loops through results and pushes value onto array and removes first in array.
    @all_user_counts.map { |m| value_array.push(m.value).shift }
    # Now can use array
    @values = value_array
  end

  private
  def authorise_admin
    redirect_to root_path if current_user.nil? || current_user.admin == false
  end
end
