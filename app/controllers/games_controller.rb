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

  def save_game
    game_data = params[:game_info]
    game = Game.find_or_initialize_by(igdb_id: game_data[:igdb_id])
    game.name = game_data[:name],
    game.cover_url = game_data[:cover_url],
    game.save!

    genres = game_data[:genres].map do |genre_name|
      Genre.find_by(name: genre_name)
    end.compact

    platforms = game_data[:platforms].map do |platform_name|
      Platform.find_by(name: platform_name)
    end.compact

    game.genres = genres
    game.platforms = platforms

    unless current_user.games.include?(game)
      current_user.games << game
    end

    if current_user.game.persisted?
      flash[:notice] = "ゲームライブラリに登録しました"
    else
      flash[:alert] = "ゲームライブラリに登録出来ませんでした"
    end
  end
end
