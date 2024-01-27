class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Add new attributes to the Devise User model
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name photo bio email password current_password])
  end
end
