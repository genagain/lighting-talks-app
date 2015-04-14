require 'rails_helper'


feature 'user comments on lighting talk' do
  context 'authenticated user' do
    scenario 'comments on a lighting talk' do
      talk = FactoryGirl.create(:talk)
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit root_path
      click_link talk.topic

      fill_in 'Comment', with: 'Great job! I enjoyed it'
      click_button 'Add Comment'

      expect(page).to have_content('Great job! I enjoyed it')
    end

    scenario 'comments on lighting talk without filling in a comment' do
      talk = FactoryGirl.create(:talk)
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit root_path
      click_link talk.topic

      click_button 'Add Comment'

      expect(page).to have_content('You cannot submit a blank comment')
    end
  end
end
