class SessionsController < ApplicationController

  def new
  end

  def create
    @user=User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      current_user
      flash[:success]="You are now logged in."
      redirect_to users_show_path
    else
      flash.now[:danger]="Login failed, try again."
      render 'new'
    end
  end

  def destroy

    sign_out
    flash[:success]="You are now logged out."
    redirect_to root_url
  end

end
