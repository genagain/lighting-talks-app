require 'rails_helper'

feature "Bag of words on transcript" do
  context "Authenticated User" do
    scenario "submits transcript to be analyzed" do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk, user: user)

      FillerWord.create(word: "[u,U]m+")
      FillerWord.create(word: "[u,U]h+")
      FillerWord.create(word: "[a,A]h{2,}")

      sign_in(user)
      visit root_path
      click_link "Profile"
      click_link talk.topic
      click_link "Record Talk"

      click_link 'Analyze Recorded Talk'

      expect(page).to have_content("You didn't say any filler words")
    end
  end
end
