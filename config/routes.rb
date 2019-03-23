Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index, :show]
  resources :authors, only: [:show]
  get '/review/:username', to: "reviews#index", as: :user_show
end
