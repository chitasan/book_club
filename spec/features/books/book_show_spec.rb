RSpec.describe 'book show page', type: :feature do
  it 'shows all book contents' do
    book_1 = create(:book)
    book_2 = create(:book)
    author_1 = create(:author)
    author_2 = create(:author)

    AuthorBook.create(author: author_1, book: book_1)
    AuthorBook.create(author: author_2, book: book_2)
    
    visit book_path(book_1)

    expect(page).to have_css("img[src*='#{book_1.book_cover_photo}']")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Publication Date: #{book_1.pub_date}")
    expect(page).to have_content("Author(s): #{book_1.authors.name}")
    expect(page).to_not have_content(book_2.title)

    visit book_path(book_2)

    expect(page).to have_css("img[src*='#{book_2.book_cover_photo}']")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Publication Date: #{book_2.pub_date}")
    expect(page).to have_content("Author(s): #{book_2.authors.name}")
    expect(page).to_not have_content(book_1.title)
  end
end  