class UserTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_titles = current_user.user_titles.order(created_at: :desc)
  end

  def get_title
    gem_cost = 100

    if current_user.gems >= gem_cost
      gemini = GeminiService.new(current_user)
      @user_title = gemini.get_user_title
    else
      flash[:alert] = "ジェムが不足しています"
      redirect_to user_titles_path, status: :see_other
    end
  end

  def save_title
    current_user.transaction do
      got_title = params[:user_title]
      user_title = UserTitle.find_or_create_by(user_id: current_user, title: got_title)
      user_title.save!
    end
    redirect_to user_titles_path, status: :see_other, notice: "称号を追加しました"
  end
end
