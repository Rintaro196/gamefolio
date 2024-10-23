class GameLogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user_game, only: %i[new create]

    def index
        @game_logs = GameLog.includes(:user)
    end

    def show
        @game_log = GameLog.includes(:user).find(params[:id])
    end

    def new
        @game_log = GameLog.new
    end

    def create
        @game_log = current_user.game_logs.build(game_log_params)
        if @game_log.save
            redirect_to game_logs_path, notice: "ゲームログを記録しました"
        else
            flash[:alert] = "ゲームログを記録出来ませんでした"
            render :new
        end
    end

    private

    def set_user_game
        @user_game = current_user.user_game.includes(:game)
    end

    def game_log_params
        params.require(:game_log).permit(:title. :body, :play_time, :spending_amount, :user_game_id)
    end
end
