require 'rails_helper'

RSpec.describe "new review" do
  context "as a visitor" do
    it "can write a new review" do
      book = create(:book)
      title = "Great Book"
      rating = 5
      review = "I would highly recommend this book"
      user = "trevor"

      visit new_book_review_path(book)

      fill_in "Review Title", with: title
      fill_in "Rating", with: rating
      fill_in "Review", with: review
      fill_in "Username", with: user

      click_button "Create Review"
      id = Review.last.id

      expect(current_path).to eq(book_path(book))

      within "#review-#{id}" do
        expect(page).to have_link("#{user.titleize}")
        expect(page).to have_content("Title: #{title}")
        expect(page).to have_content("Review: #{review}")
        expect(page).to have_content("Rating: #{rating}")
      end
    end

    it "can't write a new review with missing info" do
      book = create(:book)
      title = "Great Book"
      rating = 5
      review = "I would highly recommend this book"

      visit new_book_review_path(book)

      fill_in "Review Title", with: title
      fill_in "Rating", with: rating
      fill_in "Review", with: review

      click_button "Create Review"

      expect(page).to have_content("All fields are required")
    end
  end
end
