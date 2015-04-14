require 'rails_helper'

feature 'user edits talk' do
  context 'an authenticated user' do
    scenario 'edits their comment' do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk)
      sign_in(user)

      comment = FactoryGirl.create(:comment, talk: talk)
      visit root_path
      click_link talk.topic
      click_on("edit-comment-#{comment.id}")
      fill_in 'Comment', with: "Mehh, not your best talk"
      click_button "Edit Comment"
      expect(page).to have_content("Mehh, not your best talk")
      expect(page).to_not have_content(comment.content)
    end

    scenario 'edits their comment without content' do
      talk = FactoryGirl.create(:talk)
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment, talk: talk)
      sign_in(user)
      visit root_path
      click_link talk.topic
      click_on("edit-comment-#{comment.id}")
      fill_in 'Comment', with: ""
      click_button "Edit Comment"
      expect(page).to have_content("You cannot submit a blank comment")
    end
  end
end
