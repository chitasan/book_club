require 'rails_helper'

RSpec.describe "author show" do
  context "as a visitor" do
    it "should see some info" do
      author_1 = create(:author)
      author_2 = create(:author)
      book_1 = create(:book)
      book_2 = create(:book)
      AuthorBook.create(book: book_1, author: author_1)
      AuthorBook.create(book: book_2, author: author_1)
      AuthorBook.create(book: book_2, author: author_2)

      visit author_path(author_1)

      within "#author-info" do
        expect(page).to have_content(author_1.name)
      end
      # save_and_open_page
      within "#abook-#{book_1.id}" do
        expect(page).to have_content(book_1.title)
        expect(page).to have_content("Page Count: #{book_1.pages}")
        expect(page).to have_content("Publishing Year: #{book_1.pub_date}")
      end

      within "#abook-#{book_2.id}" do
        expect(page).to have_content(book_2.title)
        expect(page).to have_content("Page Count: #{book_2.pages}")
        expect(page).to have_content("Publishing Year: #{book_2.pub_date}")
        expect(page).to have_content("Co-Authors: #{author_2.name}")
      end
    end
  end
end
