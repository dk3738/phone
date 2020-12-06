class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :login_user, only: [:index]

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :status])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :status])
    end

    private

    def login_user
      redirect_to user_session_path unless current_user
    end

end
