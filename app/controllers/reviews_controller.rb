class ReviewsController < ApplicationController
  def index
    @user = params[:username]
    @reviews = Review.sort_username(@user)
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new(book: @book)
  end

  def create
    @book = Book.find(params[:book_id])
    @book.reviews.create(review_params)
    redirect_to (book_path(@book))
  end

  def delete
    review = Review.find(params[:review_id])
    user = review.user_name
    review.destroy
    redirect_to(user_show_path(user))
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :content, :user_name)
  end
end
