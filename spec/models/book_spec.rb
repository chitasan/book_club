require 'rails_helper'

RSpec.describe Book do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :pub_date}
  end

  describe "relationships" do
    it {should have_many :author_books}
    it {should have_many(:authors).through(:author_books)}
    it {should have_many :reviews}
  end

  describe "instance methods" do
    it ".co_authors" do
      author_1 = create(:author)
      author_2 = create(:author)
      book = create(:book)
      AuthorBook.create(author: author_1, book: book)
      AuthorBook.create(author: author_2, book: book)

      expect(book.co_authors(author_1)).to eq([author_2])
    end

    it ".top_review" do
      book = create(:book)
      review_1 = create(:good_review, book: book)
      review_2 = create(:review, book: book)
      review_3 = create(:bad_review, book: book)

      expect(book.top_review).to eq(review_1)
    end
  end
end
