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
      @review_3 = create(:good_review, book: @book_2)
      @review_4 = create(:bad_review, book: @book_2)
    end

    it "should see some info" do

      visit author_path(@author_1)

      within "#author-info" do
        expect(page).to have_content(@author_1.name)
      end

      within "#abook-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content("Page Count: #{@book_1.pages}")
        expect(page).to have_content("Publication Year: #{@book_1.pub_date}")

        within "#top-review" do
          expect(page).to have_content("Top Review: #{@review_1.title}")
          expect(page).to have_content("Rating: #{@review_1.rating}")
          expect(page).to have_content("#{@review_1.user_name} says: #{@review_1.content}")
        end
      end

      within "#abook-#{@book_2.id}" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content("Page Count: #{@book_2.pages}")
        expect(page).to have_content("Publication Year: #{@book_2.pub_date}")
        expect(page).to have_content("Co-Authors: #{@author_2.name}")
      end
    end

    it "should see top reviews for each book" do
      visit author_path(@author_1)

      within "#abook-#{@book_1.id}" do
        expect(page).to have_content("Top Review: #{@review_1.title}")
        expect(page).to have_content("Rating: #{@review_1.rating}")
        expect(page).to have_content("#{@review_1.user_name} says: #{@review_1.content}")
        expect(page).to have_link("#{@review_1.user_name}")
        click_link "#{@review_1.user_name}"
      end

      expect(current_path).to eq(user_show_path(@review_1.user_name))

      visit author_path(@author_1)

      within "#abook-#{@book_2.id}" do
        expect(page).to have_content("Top Review: #{@review_3.title}")
        expect(page).to have_content("Rating: #{@review_3.rating}")
        expect(page).to have_content("#{@review_3.user_name} says: #{@review_3.content}")
        expect(page).to have_link("#{@review_3.user_name}")
        click_link "#{@review_3.user_name}"
      end

      expect(current_path).to eq(user_show_path(@review_3.user_name))
    end

    it 'can be deleted' do 
      visit author_path(@author_1)

      book = @book_1.title
      author = @author_1.name

      expect(page).to have_link("Delete this author")
      click_link "Delete this author"

      expect(current_path).to eq(books_path)

      expect(page).to_not have_content(book)
      expect(page).to_not have_content(author)
    end 
  end
end
