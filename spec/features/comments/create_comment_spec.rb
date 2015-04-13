require 'rails_helper'


feature 'user comments on lighting talk' do
  context 'authenticated user' do
    scenario 'comments on a lighting talk' do
      talk = FactoryGirl.create(:talk)
      visit root_path
      click_link talk.topic

      fill_in 'Comment', with: 'Great job! I enjoyed it'
      click_button 'Add Comment'

      expect(page).to have_content('Great job! I enjoyed it')
    end
  end
end
