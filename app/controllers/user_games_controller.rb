class UserGamesController < ApplicationController
    before_action :authenticate_user!, only: %i[edit update destroy]
    before_action :set_user_game, only: %i[edit update destroy]

    def index
        @user = User.with_attached_user_icon.find(params[:id])
        @user_games = @user.user_games
        @playing_games = @user_games.where(status: 3)
    end

    def show
        @user_game = UserGame.find(params[:id])
        @total_play_time = @user_game.total_play_time
        @total_spending_amount = @user_game.total_spnding_amount

        @game_logs = GameLog.includes(:user, user_game: :game).with_attached_images.where(user_game_id:  @user_game.id).order(created_at: :desc)
    end

    def edit; end

    def update
        if @user_game.update(user_game_params)
            redirect_to user_game_path(@user_game), notice: "登録ゲームのステータスを更新しました"
        else
            flash.now[:alert] = "登録ゲームのステータスを更新出来ませんでした"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        gem_cost = 10

        if current_user.gem >= gem_cost
          current_user.transaction do
            @user_game.destroy!
            current_user.decrement!(:gem, gem_cost)
            current_user.decrement!(:level) if current_user.level > 1
            flash[:notice] = "ゲームライブラリから削除しました"
          end
        else
          flash[:alert] = "ジェムが不足しているため、ゲームを削除できません。"
        end
        redirect_to user_games_path(id: current_user.id), status: :see_other
    end

    private

    def set_user_game
        @user_game = current_user.user_games.find(params[:id])
    end

    def user_game_params
        params.require(:user_game).permit(:status, :memo)
    end
end
