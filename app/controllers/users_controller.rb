class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.with_attached_user_icon.order(level: :desc).page(params[:page])
  end

  def show
    @user = User.with_attached_user_icon.find(params[:id])
    @profile_title = UserTitle.find_by(id: @user.profile_title)
    @user_game_logs = @user.game_logs.includes(user_game: :game).with_attached_images.order(created_at: :desc).page(params[:page]).per(5)
    @top_5_genres = @user.top_5_genres

    set_meta_tags(@user)
  end

  private

  def set_meta_tags(user)

    image_url = 

    set_meta_tags og: {
                        site_name: "GAMEFOLIO",
                        title: "#{@user.name}のGAMEFOLIO",
                        description: "さっそく覗いてみよう！！",
                        type: "website",
                        url: request.original_url,
                        image: image_url,
                        local: "ja-JP"
                      },
                  twitter: {
                        card: "summary_large_image",
                        image: image_url
                      }

  end
end
