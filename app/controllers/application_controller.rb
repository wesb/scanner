class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path
  end
end
