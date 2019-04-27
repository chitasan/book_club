Rails.application.routes.draw do
  root "home#welcome"

  get '/books', to: "books#index", as: :books
  get '/book/:id', to: "books#show", as: :book
  get '/books/new', to: "books#new", as: :new_book
  post '/books', to: "books#create"
  get '/books/:book_id/reviews', to: "reviews#index", as: :book_reviews
  get '/books/:book_id/reviews/new', to: "reviews#new", as: :new_book_review
  post '/books/:book_id/reviews', to: "reviews#create"



  delete '/books/:id', to: "books#delete", as: :delete_book
  delete '/authors/:id', to: "authors#delete", as: :delete_author
  delete '/:review_id', to: "reviews#delete", as: :delete_review
  get '/authors/:id', to: "authors#show", as: :author
  get '/:username', to: "reviews#index", as: :user_show
  get '/:username/:sort', to: "reviews#index", as: :user_show_sort
  get '/books/:sort/:order', to: "books#index", as: :books_sort
end
