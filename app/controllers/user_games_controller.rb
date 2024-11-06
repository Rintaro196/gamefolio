class UserGamesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user_game, only: %i[edit update destroy]

    def index
        @user = User.find(params[:id])
        @user_games = @user.games
    end

    def show
        @user_game = UserGame.find(params[:id])
        @total_play_time = @user_game.total_play_time
        @total_spending_amount = @user_game.total_spnding_amount

        @game_logs = GameLog.includes(:user).where(user_game_id:  @user_game.id)
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
    end

    private

    def set_user_game
        @user_game = current_user.user_games.find(params[:id])
    end

    def user_game_params
        params.require(:user_game).permit(:status)
    end
end
