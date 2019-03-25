Rails.application.routes.draw do
  root "home#welcome"
  resources :books, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :index, :create]
  end


  delete '/books/:id', to: "books#delete", as: :delete_book
  delete '/authors/:id', to: "authors#delete", as: :delete_author
  delete '/:review_id', to: "reviews#delete", as: :delete_review
  resources :authors, only: [:show]
  get '/:username', to: "reviews#index", as: :user_show
  get '/:username/:sort', to: "reviews#index", as: :user_show_sort
end
