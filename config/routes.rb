Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :index, :create]
  end

  # resources :reviews, only: [:delete]
  delete '/:review_id', to: "reviews#delete", as: :delete_review
  resources :authors, only: [:show]
  get '/:username', to: "reviews#index", as: :user_show
end
