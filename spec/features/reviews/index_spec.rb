require 'rails_helper'

RSpec.describe "user show page" do
  context "as a visitor" do
    before :each do
      @book1 = create(:book)
      @book2 = create(:book)
      @review1 = create(:review, book: @book1)
      @review2 = create(:good_review, book: @book1, user_name: "User 1")
      @review3 = create(:bad_review, book: @book2, user_name: "User 1")
    end

    it "can see all reviews from a user" do
      visit user_show_path("User 1")

      expect(page).to have_content("#{@review1.user_name}'s page")

      within "#review-#{@review1.id}" do
        expect(page).to have_content(@review1.title)
        expect(page).to have_content("Rating: #{@review1.rating}")
        expect(page).to have_content(@review1.content)
      end

      within "#review-#{@review2.id}" do
        expect(page).to have_content(@review2.title)
        expect(page).to have_content("Rating: #{@review2.rating}")
        expect(page).to have_content(@review2.content)
      end

      within "#review-#{@review3.id}" do
        expect(page).to have_content(@review3.title)
        expect(page).to have_content("Rating: #{@review3.rating}")
        expect(page).to have_content(@review3.content)
      end
    end
  end
end
