Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "home_pages#home"

  resources :users, only: %i[index show]

  get "games/search", to: "games#search", as: "search_games"
end
