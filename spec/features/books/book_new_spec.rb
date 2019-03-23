require 'rails_helper'

RSpec.describe 'new book page', type: :feature do
  it 'should create a new book successfully' do 
    title = "To Kill a Mockingbird"
    pages = 123
    author = "Harper Lee"
    pub_date = 1950

    visit new_book_path
    save_and_open_page
    fill_in 'Title', with: title
    fill_in 'Pages', with: pages
  
    #fill_in 'Authors', with: author
    #create book.authors params 
    
    click_button 'Create Book'

    book = Book.last
    expect(current_path).to eq(book_path(book))
  end 
end 