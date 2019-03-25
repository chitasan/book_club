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
    xit ".sort_username" do
      book1 = create(:book)
      review1 = create(:review, book: book1)
      review2 = create(:review, book: book1)

      expect(Review.sort_username("User 1")).to eq([review1])
    end

    it ".sort_age" do
      book1 = create(:book)
      review1 = create(:review, book: book1, user_name: "User 1", created_at: "Fri, 22 Mar 2019 16:46:50 UTC +00:00")
      review2 = create(:review, book: book1, user_name: "User 1", created_at: "Sat, 23 Mar 2019 16:46:50 UTC +00:00")

      expect(Review.sort_age("User 1", :asc)).to eq([review1, review2])
    end

    it ".still_exists" do
      book1 = create(:book)
      review1 = create(:review, book: book1)
      review2 = create(:review, book: book1)

      expect(Review.still_exists("bananas")).to eq(false)
      expect(Review.still_exists("#{review1.user_name}")).to eq(true)
    end

    it ".most_reviews" do
      book1 = create(:book)
      create(:review, book: book1, user_name: "User 1")
      create(:review, book: book1, user_name: "User 1")
      create(:review, book: book1, user_name: "User 1")
      create(:review, book: book1, user_name: "User 1")
      create(:review, book: book1, user_name: "User 2")
      create(:review, book: book1, user_name: "User 2")
      create(:review, book: book1, user_name: "User 2")
      create(:review, book: book1, user_name: "User 3")
      create(:review, book: book1, user_name: "User 3")
      create(:review, book: book1, user_name: "User 4")

      expect(Review.most_reviews(3)[0].user_name).to eq("User 1")
      expect(Review.most_reviews(3)[1].user_name).to eq("User 2")
      expect(Review.most_reviews(3)[2].user_name).to eq("User 3")
    end

    it ".reviews_by_name" do
      book1 = create(:book)
      review1 = create(:review, book: book1)
      review2 = create(:review, book: book1, user_name: "User 1")
      review3 = create(:review, book: book1, user_name: "User 1")

      expect(Review.reviews_by_name("User 1")).to eq(3)
    end
  end
end
