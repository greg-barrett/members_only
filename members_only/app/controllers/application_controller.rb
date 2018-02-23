class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
    user.update_attribute(:remember_token, user.refresh_token)
    cookies.permanent[:remember_token]=user.remember_token
  end

  def current_user
    if cookies[:remember_token]
      @current_user= User.find_by(remember_token: cookies[:remember_token])
    else
      @current_user=nil
    end
  end

  def current_user=(value)
    @current_user=value
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user=nil
  end

  def signed_in?
    redirect_to login_url unless current_user
  end

end
