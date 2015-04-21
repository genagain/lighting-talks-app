require 'rails_helper'

feature 'user creates lighting talk', %Q(
As a user
I want to create a lighting talk
So that I can give it in the future) do
  context 'Authenticated user' do
    scenario 'creates lighting talk' do
      user = FactoryGirl.create(:user)
      sign_in(user)

      click_link 'Do a lighting talk!'

      fill_in 'Topic', with: 'Craft beer'
      fill_in 'Date', with: '2015-10-09'
      click_button 'Add Talk'
      expect(page).to have_content('You have scheduled a lighting talk!')
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

    scenario 'includes a youtube video' do
      user = FactoryGirl.create(:user)
      sign_in(user)

      click_link 'Do a lighting talk!'

      fill_in 'Topic', with: 'Craft beer'
      fill_in 'Date', with: '2015-10-09'
      fill_in 'Video URL', with: 'https://www.youtube.com/watch?v=mFTF_MfQKCg'

      click_button 'Add Talk'
      expect(page).to have_content('You have scheduled a lighting talk!')

      click_link 'Craft beer'
      expect(page).to have_selector 'iframe'

    end
  end
end
