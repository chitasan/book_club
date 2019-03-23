class ReviewsController < ApplicationController
  def index
    @user = params[:username]
    @reviews = Review.sort_username(@user)
  end
end
