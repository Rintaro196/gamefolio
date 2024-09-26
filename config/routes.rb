Rails.application.routes.draw do
  devise_for :users
  root "home_pages#home"
end
