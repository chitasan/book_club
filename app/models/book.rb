class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

  validates_presence_of :title, :pages, :pub_date

  def co_authors(author)
    co_authors = AuthorBook.where(book: self).where.not(author: author)
    authors = co_authors.map do |author|
      Author.find(author.author_id)
    end
  end
end
