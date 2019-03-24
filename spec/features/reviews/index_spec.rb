require 'rails_helper'

RSpec.describe "user show page" do
  context "as a visitor" do
    before :each do
      @book1 = create(:book)
      @book2 = create(:book)
      @review1 = create(:review, book: @book1, user_name: "User 1", created_at: "Fri, 22 Mar 2019 16:46:50 UTC +00:00")
      @review2 = create(:good_review, book: @book1, user_name: "User 1", created_at: "Sat, 23 Mar 2019 16:46:50 UTC +00:00")
      @review3 = create(:bad_review, book: @book2, user_name: "User 1", created_at: "Sun, 24 Mar 2019 16:46:50 UTC +00:00")
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

    xit "can sort reviews" do
      within "sorting" do
        expect(page).to have_link
      end
    end

    it "can delete a review" do
      visit user_show_path("User 1")

      within "#review-#{@review1.id}" do
        expect(page).to have_link("Delete this review")
        click_link "Delete this review"
      end

      expect(current_path).to eq(user_show_path("User 1"))
      expect(page).to_not have_content("meh")
    end
  end
end
