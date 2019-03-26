class Book < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy

  validates_presence_of :title, :pages, :pub_date

  def co_authors(author)
    authors.where.not(id: author.id)
  end

  def top_review
    sorted_reviews(:desc, 1).first
  end

  def sorted_reviews(order, limit)
    reviews.order(rating: order).limit(limit)
  end

  def average_rating
    reviews.average(:rating) || 0
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

  def self.bottom_three
    Book.select("books.*, avg(rating) AS avg_rating")
    .joins(:reviews)
    .group(:id)
    .order("avg_rating ASC")
    .limit(3)
  end

  def self.sort_by_pages(order)
    order(pages: order)
  end

  def self.sort_by_pub_date(order)
    order(pub_date: order)
  end

  def self.sort_by_num_reviews(order)
    joins(:reviews)
    .select("books.*, count(reviews) as num_reviews")
    .group(:id)
    .order("num_reviews #{order}")
  end
end
