class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
      admin_reservations_path
    end

    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

end
