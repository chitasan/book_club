require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  it 'shows all books contents' do
    book_1 = create(:book)
    book_2 = create(:book)
    author_1 = create(:author)
    author_2 = create(:author)
    # binding.pry
    AuthorBook.create(author: author_1, book: book_1)
    
    visit '/books'

    expect(page).to have_css("img[src*='#{book_1.book_cover_photo}']")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Publication Date: #{book_1.pub_date}")
    expect(page).to have_content("Author: #{book_1.authors.name}")

    expect(page).to have_css("img[src*='#{book_2.book_cover_photo}']")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Publication Date: #{book_2.pub_date}")
    expect(page).to have_content("Author: #{book_2.authors.name}")
  end
end
