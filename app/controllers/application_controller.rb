class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  def after_sign_out_path_for(resource)
    '/users/sign_in' 
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image,:introduction])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image,:introduction])
  end

end
