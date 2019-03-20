Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index, :show]
end
