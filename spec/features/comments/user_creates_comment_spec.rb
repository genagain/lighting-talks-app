require 'rails_helper'

feature 'user comments on lighting talk', %Q(
As a user
I want to comment on a lighting talk
So that I can provide feedback to my peer) do
  context 'Authenticated user' do
    scenario 'comments on a talk' do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk)
      sign_in(user)
      click_link(talk.topic)
      fill_in 'Comment', with: 'Great job!'
      click_button 'Comment'
      expect(page).to have_content('Great job!')
      expect(page).to have_content('Thanks for commenting')
    end
  end
end
