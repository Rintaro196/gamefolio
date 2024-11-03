class UserGamesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(params[:id])
        @user_games = @user.games
    end

    def show
        @user_game = UserGame.find(params[:id])
        @total_play_time = @user_game.total_play_time
        @total_spending_amount = @user_game.total_spnding_amount

        @game_logs = GameLog.includes(:user).where(user_game_id:  @user_game.id )
    end
end
