class GameLogsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy]
    before_action :set_game_log, only: %i[edit update destroy remove_image]
    before_action :set_user_game, only: %i[new create edit update]

    def index
        @game_logs = GameLog.includes(:user, user_game: :game).with_attached_images.order(created_at: :desc).page(params[:page]).per(5)
    end

    def show
        @game_log = GameLog.includes(:user, user_game: :game).with_attached_images.find(params[:id])
        @size = @game_log.images.size
        game_title = @game_log.user_game.game_title_method
        @game_title = game_title.gsub(" ", "")
        @comment = Comment.new
        @comments = @game_log.comments.order(created_at: :desc).page params[:page]
    end

    def new
        @game_log = GameLog.new
    end

    def create
        @game_log = GameLog.new(game_log_params)
        @game_log.user = current_user
        if @game_log.save
            redirect_to game_log_path(@game_log), notice: "ゲームログを記録しました"
        else
            flash.now[:alert] = "ゲームログを記録出来ませんでした"
            render :new, status: :unprocessable_entity
        end
    end

    def edit; end

    def update
        if @game_log.update(game_log_params)
            redirect_to game_log_path(@game_log), notice: "ゲームログを編集しました"
        else
            flash.now[:alert] = "ゲームログを編集出来ませんでした"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @game_log.images.attached?
          @game_log.transaction do
            @game_log.images.purge_later
            @game_log.destroy!
          end
        else
          @game_log.destroy!
        end
        redirect_to user_path(id: current_user.id), status: :see_other, notice: "ゲームログを削除しました"
    end

    def remove_image
        image = @game_log.images.find(params[:image_id])
        image.purge_later

        redirect_to edit_game_log_path(@game_log)
    end

    private

    def set_game_log
        @game_log = current_user.game_logs.find(params[:id])
    end

    def set_user_game
        @user_games = current_user.user_games.includes(:game)
    end

    def game_log_params
        params.require(:game_log).permit(:title, :body, :play_time, :spending_amount, :user_game_id, images: [])
    end
end
