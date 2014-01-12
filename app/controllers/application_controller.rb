class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Gets permitted params for a devise form
  before_action :devise_permitted_params, if: :devise_controller?

  after_filter :store_location

  private

  # Gets previous url if the request is coming from the public controller
  def store_location
    session[:previous_url] = request.fullpath if params[:controller] == 'public'
  end

  # If previous url session variable is present then redirect after sign in else send to normal root
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def devise_permitted_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :full_name) }
  end
end
