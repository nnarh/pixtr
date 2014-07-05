class SessionsController < ApplicationController
  def new

  end

  def create
    user  = User.find_by(email: params[:session][:email])
    cookies.signed[:user] = user.id
    redirect_to galleries_path
  end

  def destroy
    cookies.delete(:user)#cookies.signed.delete[:user]
    redirect_to galleries_path, notice: "Logged out" # this was the original redirect, now using path helpers see notes"/galleries"
  end
end