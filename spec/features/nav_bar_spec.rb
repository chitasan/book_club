require 'rails_helper'

RSpec.describe "nav bar" do
  context "as a visitor" do
    xit "should see a nav bar" do
      book = create(:book)
      visit root_path

      within "#nav-bar" do
        expect(page).to have_link("Go to Books")
        expect(page).to_not have_link("Return to Homepage")
        click_on "Go to Books"
      end

      expect(current_path).to eq(books_path)

      within "#nav-bar" do
        expect(page).to_not have_link("Go to Books")
        expect(page).to have_link("Return to Homepage")
        click_on "Return to Homepage"
      end

      expect(current_path).to eq(root_path)
    end
  end
end
