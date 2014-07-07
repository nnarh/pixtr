class HomesController < ApplicationController

  def show
    @user = User.new
  end

  def require_login
    if !signed_in?
      redirect_to new_session_path
    end
  end
end
