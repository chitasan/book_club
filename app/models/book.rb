class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  validates_presence_of :title, :pages, :pub_date

  def self.with_authors
    select("books.*, authors.*").joins(:authors)
  end 
end
