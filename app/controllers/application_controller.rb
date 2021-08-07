class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?



    def authenticate_admin!
        redirect_to new_user_session_path unless (current_user && current_user.admin)
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    end
end
