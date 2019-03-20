require 'rails_helper'

RSpec.describe "author show" do
  context "as a visitor" do
    before :each do
      @author_1 = create(:author)
      @author_2 = create(:author)
      @book_1 = create(:book)
      @book_2 = create(:book)
      AuthorBook.create(book: @book_1, author: @author_1)
      AuthorBook.create(book: @book_2, author: @author_1)
      AuthorBook.create(book: @book_2, author: @author_2)
      @review_1 = create(:good_review, book: @book_1)
      @review_2 = create(:bad_review, book: @book_1)
    end
    it "should see some info" do

      visit author_path(@author_1)

      within "#author-info" do
        expect(page).to have_content(@author_1.name)
      end
      # save_and_open_page
      within "#abook-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content("Page Count: #{@book_1.pages}")
        expect(page).to have_content("Publishing Year: #{@book_1.pub_date}")

        within "#top-review" do
          expect(page).to have_content("Top Review: #{@review_1.title}")
          expect(page).to have_content("Rating: #{@review_1.rating}")
          expect(page).to have_content("#{@review_1.user_name} says: #{@review_1.content}")
        end
      end

      within "#abook-#{@book_2.id}" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content("Page Count: #{@book_2.pages}")
        expect(page).to have_content("Publishing Year: #{@book_2.pub_date}")
        expect(page).to have_content("Co-Authors: #{@author_2.name}")
      end
    end
  end
end
