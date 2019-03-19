class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates_presence_of :name

  def self.with_books
      select("books.*, authors.*").joins(:books)
  end 
end
