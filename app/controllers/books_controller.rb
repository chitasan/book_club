class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_three = Book.top_three
    @bottom_three = Book.bottom_three
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    if book.save
      redirect_to book_path(book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :authors)
  end
end
