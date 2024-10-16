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

  def save_game
    game_data = params[:game_info]
    game = Game.find_or_initialize_by(igdb_id: game_data[:igdb_id])
    game.update(
      name: game_data[:name],
      cover_url: game_data[:cover_url],
      genres: game_data[:genres]&.join(', '),
      platforms: game_data[:platforms]&.join(', ')
    )

    if game.persisted?
      flash[:notice] = "ゲームライブラリに登録しました"
    else
      flash[:alert] = "ゲームライブラリに登録出来ませんでした"
    end
  end
end
