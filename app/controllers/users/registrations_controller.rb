# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @user = current_user
    @user_titles = @user.user_titles
  end

  # PUT /resource
  def update
    ActiveRecord::Base.transaction do
      if params[:user][:user_icon].present? && current_user.user_icon.attached?
        @old_icon = current_user.user_icon
        @old_icon.purge_later
      end

      if resource.update(account_update_params)
        redirect_to after_update_path_for(resource), notice: "プロフィールを変更しました"
      else
        render :edit
        raise ActiveRecord::Rollback
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :user_code ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :user_code, :age, :gender, :profile, :user_icon, :twitter, :twitch, :discord, :profile_title ])
  end

  def update_resource(resouece, params)
    resource.update_without_password(params)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    user_path(id: current_user.id)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    user_path(id: current_user.id)
  end

  def after_update_path_for(resouece)
    user_path(id: current_user.id)
  end
end
