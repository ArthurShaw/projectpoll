class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def vkontakte
    @user = User.from_vk(params[:code])
    sign_in_and_redirect @user
  end
end
