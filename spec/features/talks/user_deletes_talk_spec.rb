
require 'rails_helper'

feature 'user deletes lighting talk', %Q(
As a user
I want to delete a lighting talk
So that I don\'t have to do a talk in the future) do
  context 'Authenticated user' do
    scenario 'deletes lighting talk' do
      user = FactoryGirl.create(:user)
      talk = Talk.create(topic: 'Craft beer', date: '2015-03-11', user_id: user.id)
      sign_in(user)
      click_link(talk.topic)
      click_link('Delete')
      expect(page).to have_content('You have deleted a lighting talk!')
      expect(page).to_not have_content('Brewing Craft Beer')
    end
  end
end
