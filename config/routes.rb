Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index, :show] do
    resources :reviews, only: [:new]
  end
  resources :authors, only: [:show]
  get '/:username', to: "reviews#index", as: :user_show
end
