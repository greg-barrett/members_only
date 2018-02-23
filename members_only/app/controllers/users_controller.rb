class UsersController < ApplicationController
  before_action :signed_in?, only: [:show]
  def show
    @user=User.find_by(remember_token: cookies[:remember_token])
  end
end
