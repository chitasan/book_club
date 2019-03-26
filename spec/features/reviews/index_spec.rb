require 'rails_helper'

RSpec.describe "user show page" do
  context "as a visitor" do
    before :each do
      @book1 = create(:book)
      @book2 = create(:book)
      @review1 = create(:review, book: @book1, user_name: "User 1", created_at: "Fri, 22 Mar 2019 16:46:50 UTC +00:00")
      @review2 = create(:good_review, book: @book1, user_name: "User 1", created_at: "Sat, 23 Mar 2019 16:46:50 UTC +00:00")
      @review3 = create(:bad_review, book: @book1, user_name: "User 1", created_at: "Sun, 24 Mar 2019 16:46:50 UTC +00:00")
    end

    it "can see all reviews from a user" do
      visit user_show_path("User 1")

      expect(page).to have_content("#{@review1.user_name}'s page")

      within "#review-#{@review1.id}" do
        expect(page).to have_link(@review1.book.title)
        expect(page).to have_content(@review1.title)
        expect(page).to have_content("Rating: #{@review1.rating}")
        expect(page).to have_content(@review1.content)
      end

      within "#review-#{@review2.id}" do
        expect(page).to have_link(@review2.book.title)
        expect(page).to have_content(@review2.title)
        expect(page).to have_content("Rating: #{@review2.rating}")
        expect(page).to have_content(@review2.content)
      end

      within "#review-#{@review3.id}" do
        expect(page).to have_link(@review3.book.title)
        expect(page).to have_content(@review3.title)
        expect(page).to have_content("Rating: #{@review3.rating}")
        expect(page).to have_content(@review3.content)
      end
    end

    it "can sort reviews" do
      visit user_show_path("User 1")

      within "#sorting" do
        click_link "Sort by oldest"
      end

      expect(current_path).to eq(user_show_sort_path("User 1", :asc))

      within "#reviews" do
        expect(page.all(".review")[0]).to have_content(@review1.title)
        expect(page.all(".review")[1]).to have_content(@review2.title)
        expect(page.all(".review")[2]).to have_content(@review3.title)
      end

      within "#sorting" do
        click_link "Sort by newest"
      end

      expect(current_path).to eq(user_show_sort_path("User 1", :desc))

      within "#reviews" do
        expect(page.all(".review")[2]).to have_content(@review1.title)
        expect(page.all(".review")[1]).to have_content(@review2.title)
        expect(page.all(".review")[0]).to have_content(@review3.title)
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

    it "is redirected to the books index page if it is the last review from a user" do
      book = create(:book)
      review = create(:review, book: book, user_name: "dude")

      visit user_show_path(review.user_name)

      within "#review-#{review.id}" do
        click_link "Delete this review"
      end

      expect(current_path).to eq(books_path)
    end
  end
end
