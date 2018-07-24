class ApplicationController < ActionController::Base
  def current_user
    @user ||= User.find_by(access_token: session[:token])
  end
end
