Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "home_pages#home"
  resources :users, only: %i[index show]
end
