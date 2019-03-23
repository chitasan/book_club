require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  before :each do
    @book_1 = create(:book)
    @book_2 = create(:book)
    @book_3 = create(:book)
    @book_4 = create(:book)
    @author_1 = create(:author)
    @author_2 = create(:author)

    AuthorBook.create(author: @author_1, book: @book_1)
    AuthorBook.create(author: @author_2, book: @book_2)

    @review_1 = create(:good_review, book: @book_1, user_name: "User 1")
    @review_2 = create(:good_review, book: @book_1, user_name: "User 2")
    @review_3 = create(:review, book: @book_2, user_name: "User 3")
    @review_4 = create(:review, book: @book_2, user_name: "User 1")
    @review_5 = create(:review, book: @book_3, user_name: "User 2")
    @review_6 = create(:bad_review, book: @book_3, user_name: "User 3")
    @review_7 = create(:bad_review, book: @book_4, user_name: "User 4")
  end

  it 'shows all books contents' do
    visit books_path

    within "#book-#{@book_1.id}" do
      expect(page).to have_css("img[src*='#{@book_1.book_cover_photo}']")
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content("Pages: #{@book_1.pages}")
      expect(page).to have_content("Publication Year: #{@book_1.pub_date}")
      expect(page).to have_content("Author(s): #{@book_1.authors.name}")
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_css("img[src*='#{@book_2.book_cover_photo}']")
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("Pages: #{@book_2.pages}")
      expect(page).to have_content("Publication Year: #{@book_2.pub_date}")
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

  it 'shows statistics about all books' do
    visit books_path

    within "#book_stats" do

      within "#best_three" do
        expect(page).to have_content("Highest-Rated Books:")
        expect(page).to have_link("#{@book_1.title}")
        expect(page).to have_link("#{@book_2.title}")
        expect(page).to have_link("#{@book_3.title}")
      end

      within "#worst_three" do
        expect(page).to have_content("Worst-Rated Books:")
        expect(page).to have_link("#{@book_4.title}")
        expect(page).to have_link("#{@book_3.title}")
        expect(page).to have_link("#{@book_2.title}")
      end

      within "#most_reviews" do
        expect(page).to have_content("Users With The Most Reviews:")
        expect(page).to have_content("#{@review_1.user_name} has written #{Review.reviews_by_name("User 1")} reviews")
        expect(page).to have_content("#{@review_2.user_name} has written #{Review.reviews_by_name("User 2")} reviews")
        expect(page).to have_content("#{@review_3.user_name} has written #{Review.reviews_by_name("User 3")} reviews")
      end
    end
  end
end
