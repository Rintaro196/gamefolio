# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = user.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "Google認証でログインしました"
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, alert: "認証できませんでした"
    end
  end
end
