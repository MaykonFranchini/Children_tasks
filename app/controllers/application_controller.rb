class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
   include Pagy::Backend

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id, :first_name, :last_name, :date_of_birth, :admin, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :admin, :photo])
  end
end
