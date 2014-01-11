class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :devise_permitted_params, if: :devise_controller?

  private

  def devise_permitted_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :full_name) }
  end
end
