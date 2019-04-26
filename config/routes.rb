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
  get '/books/:sort/:order', to: "books#index", as: :books_sort

  #mod3 prework routes
  # get '/books' to: 'books#index'
  # get '/books/:id', to: 'books#show'
  # get '/books/new', to: 'books#new'
  # post '/books', to: 'books#create'

  # get '/books/:id/reviews', to: 'reviews#index'
  # get '/books/:id/reviews/new', to: 'reviews#new'
  # post '/books/:id/reviews/', to: 'reviews#create'

  # get '/authors/:id', to: 'authors#show'

  # resources :books, only: [:destroy]
  # resources :authors, only: [:destroy]
  # resources :reviews, only: [:destroy]
end
