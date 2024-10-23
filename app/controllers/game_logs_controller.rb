class GameLogsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @game_logs = Game_log.includes(:user)
    end

    def show
        @game_log = Game_log.includes(:user).find(params[:id])
    end

    def new
        @game_log = Game_log.new
    end

    def create
        @game_log = current_user.game_logs.build(game_log_params)
        if @game_log.save
            flash[:notice] = "ゲームログを記録しました"
            redirect_to game_logs_path
        else
            flash[:alert] = "ゲームログを記録出来ませんでした"
            render :new
        end
    end

    private

    def game_log_params
        params.require(:game_log).permit(:title. :body, :play_time, :spending_amount).merge(user_game_id: params[:user_game_id])
    end
end
