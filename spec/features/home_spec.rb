require 'rails_helper'

RSpec.describe "welcome page" do
  context "as a visitor" do
    it "should see a welcome message and our github links" do
      trevor = Contributor.create(name: "Trevor", github: "https://github.com/tnodland")
      chi = Contributor.create(name: "Chi", github: "https://github.com/chitasan")

      visit root_path

      expect(page).to have_content("Welcome to our Book Club Project")

      within "#contributor-#{trevor.id}" do
        expect(page).to have_content("Name: #{trevor.name}")
        expect(page).to have_content("Github: ")
        expect(page).to have_link("#{trevor.github}")
      end
      
      within "#contributor-#{chi.id}" do
        expect(page).to have_content("Name: #{chi.name}")
        expect(page).to have_content("Github: ")
        expect(page).to have_link("#{chi.github}")
      end
    end
  end
end
