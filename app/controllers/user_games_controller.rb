class UserGamesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(params[:id])
        @user_games = @user.games
    end

    def show
        @user_game = UserGame.find(params[:id])
        @total_play_time = @user_game.total_play_time
        @total_spnding_amount = @user_game.total_spnding_amount
    end
end
