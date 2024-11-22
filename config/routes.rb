Rails.application.routes.draw do
  get "likes/create"
  get "likes/destory"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "home_pages#home"

  resources :users, only: %i[index show]
  resources :likes, only: %i[create destory]
  resources :user_games

  resources :game_logs do
    member do
      delete :remove_image
    end
  end

  get "games/search", to: "games#search", as: "search_games"
  post "games/save_game", to: "games#save_game", as: "save_game"

  get "policy", to: "home_pages#policy", as: "policy"
end
