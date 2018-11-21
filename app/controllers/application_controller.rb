class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#  rescue_from ActiveRecord::RecordNotFound, with: :render_404
#  rescue_from ActionController::RoutingError, with: :render_404
#  rescue_from Exception, with: :render_500

#  def render_404
#    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
#  end

#  def render_500
#    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
#  end

  def after_sign_in_path_for(resource)
    admin_reservations_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end
