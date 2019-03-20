Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index]
  resources :authors, only: [:show]
end
