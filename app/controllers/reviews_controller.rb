class ReviewsController < ApplicationController
  def index
    @user = params[:username]
    @reviews = show_params(@user)
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new(book: @book)
  end

  def create
    @book = Book.find(params[:book_id])
    review = @book.reviews.create(review_params)
    review.user_name = review.user_name.titleize
    if review.save
      redirect_to (book_path(@book))
    else
      @review = Review.new
      flash[:failure] = "All fields are required"
      render :new
    end
  end

  def delete
    review = Review.find(params[:review_id])
    user = review.user_name
    review.destroy
    if Review.still_exists(user)
      redirect_to(user_show_path(user))
    else
      redirect_to books_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :content, :user_name)
  end

  def show_params(user)
    if params[:sort]
      Review.sort_age(user, params[:sort].to_sym)
    else
      Review.sort_username(user)
    end
  end
end
