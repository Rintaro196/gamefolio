class GamesController < ApplicationController
  before_action :authenticate_user!

  def search
    @game_title = params[:title]

    if @game_title.present?
      igdb = IgdbService.new
      @game_info = igdb.search_game(@game_title)
    else
      @game_info = nil
    end
  end

  def add_to_game_library
  end
end
