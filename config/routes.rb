Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "home_pages#home"

  resources :users, only: %i[index show]
  resources :user_games

  resources :game_logs do
    member do
      delete :remove_image
    end
  end

  get "games/search", to: "games#search", as: "search_games"
  post "games/save_game", to: "games#save_game", as: "save_game"
end
