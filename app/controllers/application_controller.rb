class ApplicationController < ActionController::Base
  before_action :basic_auth, :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, passwword|
      username == 'admin' && passwword == '1111'
    end
  end
end
