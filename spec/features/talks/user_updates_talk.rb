require 'rails_helper'

feature 'user updates lighting talk', %Q(
As a user
I want to updates a lighting talk
So that I can change a talk\'s details) do
  context 'Authenticated user' do
    scenario 'creates lighting talk' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      expect(page).to have_content('You have updated a lighting talk!')
      expect(page).to have_content('Craft beer')
    end

    scenario 'doesn\'t fill out topic' do
      user = FactoryGirl.create(:user)
      sign_in(user)

      click_link 'Do a lighting talk!'

      fill_in 'Date', with: '2015-10-09'

      click_button 'Add Talk'
      expect(page).to have_content('Topic can\'t be blank')
    end

    scenario 'doesn\'t fill out date' do
      user = FactoryGirl.create(:user)
      sign_in(user)

      click_link 'Do a lighting talk!'

      fill_in 'Topic', with: 'Craft beer'

      click_button 'Add Talk'
      expect(page).to have_content('Date can\'t be blank')
    end

    scenario 'doesn\'t fill out date and topic' do
      user = FactoryGirl.create(:user)
      sign_in(user)

      click_link 'Do a lighting talk!'

      click_button 'Add Talk'
      expect(page).to have_content('Topic can\'t be blank')
      expect(page).to have_content('Date can\'t be blank')
    end
  end
end
