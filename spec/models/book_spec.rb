require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    it {should validate_presence_of :title}
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
      expect(@book_1.top_review).to eq(@review_1)
      expect(@book_2.top_review).to eq(@review_5)
    end

    it '.average_rating' do
      expect(@book_1.average_rating.round(1)).to eq(3)
      expect(@book_2.average_rating.round(1)).to eq(2)
    end 

    it '.total_reviews' do
      expect(@book_1.total_reviews).to eq(3)
      expect(@book_2.total_reviews).to eq(2)
    end
  end
end
