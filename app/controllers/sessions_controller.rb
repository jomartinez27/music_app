class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to user_url
    else
      flash.now[:errors] = ['Invalid password and/or username']
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_users_url
  end
end
