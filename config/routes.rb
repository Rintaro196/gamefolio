Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "home_pages#home"

  resources :users, only: %i[index show]

  get "search_games/search", to: "search_games#search", as: "search_games"
end
