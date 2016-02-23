class UsersController < ApplicationController
  def profile
    @user = current_user
    unless @user
      redirect_to new_user_session_path
    else
      render 'profile'
    end
  end
end
