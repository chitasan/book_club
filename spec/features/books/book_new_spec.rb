require 'rails_helper'

RSpec.describe 'new book page', type: :feature do
  it 'should create a new book successfully' do
    title = "to kill a mockingbird"
    pages = 123
    authors = "harper lee, trevor"
    pub_date = 1950

    visit new_book_path

    fill_in 'Title', with: title
    fill_in 'Pages', with: pages
    fill_in 'Publication Date', with: pub_date
    fill_in 'Author(s)', with: authors

    click_button 'Create Book'

    book = Book.last
    expect(current_path).to eq(book_path(book))

    visit author_path(Author.last)
    expect(page).to have_content(title.titleize)
    expect(page).to have_content(pages)
    expect(page).to have_content(pub_date)
  end

  it "can't save a book with missing info" do
    title = "To Kill a Mockingbird"
    pages = 123
    authors = "Harper Lee, Trevor"

    visit new_book_path

    fill_in 'Title', with: title
    fill_in 'Pages', with: pages
    fill_in 'Author(s)', with: authors

    click_button 'Create Book'

    expect(page).to have_content("1 error prevented it from being saved:")
  end

  it "cant create a book without an author" do
    title = "to kill a mockingbird"
    pages = 123
    pub_date = 1950

    visit new_book_path

    fill_in 'Title', with: title
    fill_in 'Pages', with: pages
    fill_in 'Publication Date', with: pub_date

    click_button 'Create Book'

    expect(current_path).to eq(new_book_path)
    expect(page).to have_content("A book needs at least one author")
  end
end
