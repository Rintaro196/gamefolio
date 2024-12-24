Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root "home_pages#home"

  resources :users, only: %i[index show]
  resources :user_games
  resources :user_titles, only: %i[index]

  resources :game_logs do
    member do
      delete :remove_image
    end

    resources :comments, only: %i[create update destroy], shallow: true

    collection do
      get :likes
    end
  end

  resources :likes, only: %i[create destroy]

  resources :notifications, only: %i[index] do
    collection do
      delete :delete_all
    end
  end

  get "games/search", to: "games#search", as: "search_games"
  post "games/save_game", to: "games#save_game", as: "save_game"

  get "policy", to: "home_pages#policy", as: "policy"
  get "rule", to: "home_pages#rule", as: "rule"

  get "user_titles/get_title", to: "user_titles#get_title", as: "get_title"
  post "user_titles/save_title", to: "user_titles#save_title", as: "save_title"
end
