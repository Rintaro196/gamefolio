class UserTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_titles = current_user.user_titles.order(created_at: :desc)
  end

  def get_title
    user = current_user
  end
end
