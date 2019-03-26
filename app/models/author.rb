class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books

  validates_uniqueness_of :name
end
