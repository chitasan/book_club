RSpec.describe 'book show page', type: :feature do
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

  it 'shows all contents for a book (cover photo, title, pages, pub year, author(s)' do
    visit book_path(@book_1)

    expect(page).to have_css("img[src*='#{@book_1.book_cover_photo}']")
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content("Pages: #{@book_1.pages}")
    expect(page).to have_content("Publication Year: #{@book_1.pub_date}")
    expect(page).to have_content("Author(s): #{@book_1.authors.name}")
    expect(page).to_not have_content(@book_2.title)

    visit book_path(@book_2)

    expect(page).to have_css("img[src*='#{@book_2.book_cover_photo}']")
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content("Pages: #{@book_2.pages}")
    expect(page).to have_content("Publication Year: #{@book_2.pub_date}")
    expect(page).to have_content("Author(s): #{@book_2.authors.name}")
    expect(page).to_not have_content(@book_1.title)
  end

  # it 'should show all review contents for a book' do
  #   visit book_path(@book_1)

  #   within "#review-#{@review_1.id}" do
  #     expect(page).to have_content("User: #{@review_1.user_name}")
  #     expect(page).to have_content("Title: #{@review_1.title}")
  #     expect(page).to have_content("Review: #{@review_1.content}")
  #     expect(page).to have_content("Rating: #{@review_1.rating}")
  #   end 
  # end 
end  