require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  it 'shows all books contents' do
    # book_1 = Book.create(title: 'Book 1', pages: 200, pub_date: 2000, book_cover_photo: "url_1")
    # book_2 = Book.create(title: 'Book 2', pages: 300, pub_date: 2001, book_cover_photo: "url_2")
    book_1 = create(:book)
    book_2 = create(:book)
    author = Author.create()
    visit '/books'

    expect(page).to have_css("img[src*='#{book_1.book_cover_photo}']")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Publication Date: #{book_1.pub_date}")

    expect(page).to have_css("img[src*='#{book_2.book_cover_photo}']")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Publication Date: #{book_2.pub_date}")
  end
end
