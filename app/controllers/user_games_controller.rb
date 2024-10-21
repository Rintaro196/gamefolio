class UserGamesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(params[:id])
        @user_games = @user.games
    end
end
