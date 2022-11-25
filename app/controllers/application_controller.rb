class ApplicationController < ActionController::Base
  before_action :authenticate_user! #-> routes to the login / signup if not authenticated
  skip_before_action :authenticate_user!, only: [:static]
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :password, :current_password)
    end
  end
end
