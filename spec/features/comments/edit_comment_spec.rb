require 'rails_helper'

feature 'user edits talk' do
  context 'an authenticated user' do
    scenario 'edits their comment' do
      talk = FactoryGirl.create(:talk)
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment, talk: talk)
      visit root_path
      click_link talk.topic
      click_on("edit-comment-#{comment.id}")
      fill_in 'Comment', with: "Mehhh, not your best talk"
      click_button "Add Comment"
      expect(page).to have_content("Mehh, not your best talk")
      expect(page).to_not have_content(comment.content)
    end
  end
end
