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
  end
end
