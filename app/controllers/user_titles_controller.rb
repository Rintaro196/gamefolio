class UserTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_titles = current_user.user_titles.order(created_at: :desc).page(params[:page]).per(5)
  end

  def get_title
    @user = current_user
    gem_cost = 100

    if current_user.gem >= gem_cost
      current_user.transaction do
        current_user.decrement!(:gem, gem_cost)
        gemini = GeminiService.new(current_user)
        @user_title = gemini.get_user_title
      end
    else
      flash[:alert] = "ジェムが不足しています"
      redirect_to user_titles_path, status: :see_other
    end
  end

  def save_title
    title_data = params[:user_title]
    user_title = UserTitle.find_or_initialize_by(user_id: current_user.id, title: title_data)

    if user_title.new_record?
      if user_title.save
        redirect_to user_titles_path, status: :see_other, notice: "称号を保存しました"
      else
        flash[:alert] = "称号を登録できませんでした"
        redirect_to user_titles_path, status: :see_other
      end
    else
      redirect_to user_titles_path, status: :see_other, alert: "既に獲得している称号です"
    end
  end
end
