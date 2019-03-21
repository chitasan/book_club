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

  def self.highest_rated
    @books
  end 

  def self.worst_rated
  end 
end
