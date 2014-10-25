class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    devices_path
  end

  protected
    def configure_permitted_parameters
      [:sign_up, :account_update].each do |type|
        devise_parameter_sanitizer.for(type) << :name
      end
    end
end
