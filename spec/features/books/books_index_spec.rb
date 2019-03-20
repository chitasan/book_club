require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  before :each do
    @book_1 = create(:book)
    @book_2 = create(:book)
    @author_1 = create(:author)
    @author_2 = create(:author)

    AuthorBook.create(author: @author_1, book: @book_1)
    AuthorBook.create(author: @author_2, book: @book_2)

    @review_1 = create(:good_review, book: @book_1)
    @review_2 = create(:bad_review, book: @book_1)
  end

  it 'shows all books contents' do
    visit books_path

    within "#book-#{@book_1.id}" do
      expect(page).to have_css("img[src*='#{@book_1.book_cover_photo}']")
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content("Pages: #{@book_1.pages}")
      expect(page).to have_content("Publication Date: #{@book_1.pub_date}")
      expect(page).to have_content("Author(s): #{@book_1.authors.name}")
    end 

    within "#book-#{@book_2.id}" do
      expect(page).to have_css("img[src*='#{@book_2.book_cover_photo}']")
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("Pages: #{@book_2.pages}")
      expect(page).to have_content("Publication Date: #{@book_2.pub_date}")
      expect(page).to have_content("Author(s): #{@book_2.authors.name}")
    end 
  end

  it 'shows average book rating' do
    visit books_path

    within "#book-#{@book_1.id}" do
      expect(page).to have_content("Average Rating: #{@book_1.average_rating}")
    end 
  end

  it 'shows total number of reviews' do
    visit books_path

    within "#book-#{@book_1.id}" do
      expect(page).to have_content("Total No. of Reviews: #{@book_1.total_reviews}")
    end 
  end
end
