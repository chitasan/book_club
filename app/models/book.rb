class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

  validates_presence_of :title, :pages, :pub_date

  def co_authors(author)
    authors.where.not(id: author.id)
  end

  def top_review
    reviews.order(rating: :desc).first
  end

  def average_rating
    reviews.average(:rating)
  end

  def total_reviews
    reviews.count
  end

  def self.top_three
    Book.select("books.*, avg(rating) AS avg_rating")
    .joins(:reviews)
    .group(:id)
    .order("avg_rating DESC")
    .limit(3)
  end
end
