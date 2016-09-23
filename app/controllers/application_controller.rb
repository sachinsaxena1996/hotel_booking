class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :configure_sign_up_params, if: :devise_controller?
  devise_group :person, contains: [:customer, :support_agent, :admin]
  before_action :authenticate_person!

  def after_sign_in_path_for(resource)
      bookings_path
  end

  protected
  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :employee_number,
       :password, :password_confirmation, :invitation_token])
  end

  def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :contact_number,
       :email,:password, :password_confirmation])
  end
end
