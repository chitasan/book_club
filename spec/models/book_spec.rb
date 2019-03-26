require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    it {should validate_uniqueness_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :pub_date}
  end

  describe 'relationships' do
    it {should have_many :author_books}
    it {should have_many(:authors).through(:author_books)}
    it {should have_many :reviews}
  end

  describe 'instance methods' do
    before :each do
      @book_1 = create(:book)
      @book_2 = create(:book)

      @author_1 = create(:author)
      @author_2 = create(:author)

      AuthorBook.create(author: @author_1, book: @book_1)
      AuthorBook.create(author: @author_2, book: @book_1)

      @review_1 = create(:good_review, book: @book_1)
      @review_2 = create(:review, book: @book_1)
      @review_3 = create(:bad_review, book: @book_1)

      @review_4 = create(:bad_review, book: @book_2)
      @review_5 = create(:review, book: @book_2)
    end

    it '.co_authors' do
      expect(@book_1.co_authors(@author_1)).to eq([@author_2])
    end

    it '.top_review' do
      expect(@book_1.sorted_reviews(:desc, 1)).to eq([@review_1])
      expect(@book_2.sorted_reviews(:desc, 1)).to eq([@review_5])
    end

    it '.average_rating' do
      expect(@book_1.average_rating.round(1)).to eq(3)
      expect(@book_2.average_rating.round(1)).to eq(2)
    end

    it '.total_reviews' do
      expect(@book_1.total_reviews).to eq(3)
      expect(@book_2.total_reviews).to eq(2)
    end

    it 'sorted_reviews' do
      expect(@book_1.sorted_reviews(:desc, 3)).to eq([@review_1, @review_2, @review_3])
      expect(@book_2.sorted_reviews(:asc, 2)).to eq([@review_4, @review_5])
    end
  end

  describe 'class methods' do
    before :each do
      @book_1 = create(:short_book, pub_date: 1963)
      @book_2 = create(:book, pub_date: 1950)
      @book_3 = create(:long_book, pub_date: 1975)
      @book_4 = create(:book, pages: 600, pub_date: 1954)

      @author_1 = create(:author)
      @author_2 = create(:author)

      AuthorBook.create(author: @author_1, book: @book_1)
      AuthorBook.create(author: @author_2, book: @book_1)

      @review_1 = create(:good_review, book: @book_1)
      @review_2 = create(:good_review, book: @book_1)
      @review_3 = create(:good_review, book: @book_1)
      @review_10 = create(:good_review, book: @book_1)
      @review_4 = create(:good_review, book: @book_2)
      @review_5 = create(:review, book: @book_2)
      @review_6 = create(:review, book: @book_2)
      @review_7 = create(:review, book: @book_3)
      @review_8 = create(:bad_review, book: @book_3)
      @review_9 = create(:bad_review, book: @book_4)
    end

    it ".top_three" do
      expect(Book.top_three).to eq([@book_1, @book_2, @book_3])
    end

    it ".bottom_three" do
      expect(Book.bottom_three).to eq([@book_4, @book_3, @book_2])
    end

    it ".sort_by_pages" do
      expect(Book.sort_by_pages(:asc)).to eq([@book_1, @book_2, @book_3, @book_4])
      expect(Book.sort_by_pages(:desc)).to eq([@book_4, @book_3, @book_2, @book_1])
    end

    it ".sort_by_pub_date" do
      expect(Book.sort_by_pub_date(:asc)).to eq([@book_2, @book_4, @book_1, @book_3])
      expect(Book.sort_by_pub_date(:desc)).to eq([@book_3, @book_1, @book_4, @book_2])
    end

    it ".sort_by_num_reviews" do
      expect(Book.sort_by_num_reviews("ASC")).to eq([@book_4, @book_3, @book_2, @book_1])
      expect(Book.sort_by_num_reviews("DESC")).to eq([@book_1, @book_2, @book_3, @book_4])
    end
  end
end
