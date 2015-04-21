require 'rails_helper'

feature "Bag of words on transcript" do
  context "Authenticated User" do
    scenario "submits transcript to be analyzed" do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk, user: user)
      transcript = '''
        Yeah, umm I you know, decided to do ummmmmm a lighting talk today. I don\'t like
        know what do talk about ahhhh but here I go. Uhhhhh. Hopefully the speech
        to text will process filler words as well as ummm crutch words.
      '''
      FillerWord.create(word: "[u,U]m+")
      FillerWord.create(word: "[u,U]h+")
      FillerWord.create(word: "[a,A]h{2,}")

      sign_in(user)
      visit root_path
      click_link "Profile"
      click_link talk.topic
      fill_in "Transcript", with: transcript
      click_button 'Analyze Transcript'

      expect(page).to have_content("Um")
      expect(page).to have_content("Ah")
      expect(page).to have_content("Uh")
    end
  end
end
