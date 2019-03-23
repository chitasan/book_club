require 'rails_helper'

RSpec.describe Review do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :content}
    it {should validate_presence_of :user_name}
  end

  describe "relationships" do
    it {should belong_to :book}
  end

  describe "class methods" do
    it ".sort_username" do
      book1 = create(:book)
      review1 = create(:review, book: book1)
      review2 = create(:review, book: book1)

      expect(Review.sort_username("User 1")).to eq([review1])
    end
  end

  describe "instance methods" do
    it ".reviews_by_name" do
      book1 = create(:book)
      review1 = create(:review, book: book1)
      review2 = create(:review, book: book1, user_name: "User 1")
      review3 = create(:review, book: book1, user_name: "User 1")

      expect(review1.reviews_by_name).to eq(3)
    end
  end
end
