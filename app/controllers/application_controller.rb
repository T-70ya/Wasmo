class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :sinkitoroku, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_NINSHO_USER"] && password == ENV["BASIC_NINSHO_PASSWORD"]
    end
  end

  def sinkitoroku
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
