require 'rails_helper'

feature 'user updates lighting talk', %Q(
As a user
I want to updates a lighting talk
So that I can change a talk\'s details) do
  context 'Authenticated user' do
    scenario 'updates lighting talk' do
      talk = Talk.create(topic: 'Craft beer', date: '2015-03-11')
      user = FactoryGirl.create(:user)
      sign_in(user)
      click_link(talk.topic)
      click_link('Edit')
      fill_in 'Topic', with: 'Brewing Craft Beer'
      click_button('Update')
      expect(page).to have_content('You have updated a lighting talk!')
      expect(page).to have_content('Brewing Craft Beer')
    end

    scenario 'doesn\'t fill out topic' do
      user = FactoryGirl.create(:user)
      talk = Talk.create(topic: 'Craft beer', date: '2015-03-11')
      sign_in(user)

      click_link(talk.topic)
      click_link('Edit')

      fill_in 'Topic', with: ''
      fill_in 'Date', with: '2015-10-09'

      click_button 'Update'

      expect(page).to have_content('Topic can\'t be blank')
      expect(page).to_not have_content('2015-10-09')
    end

    scenario 'doesn\'t fill out date' do
      user = FactoryGirl.create(:user)
      talk = Talk.create(topic: 'Craft beer', date: '2015-03-11')
      sign_in(user)

      click_link(talk.topic)
      click_link('Edit')

      fill_in 'Topic', with: 'Craft beer'
      fill_in 'Date', with: ''

      click_button 'Update'
      expect(page).to have_content('Date can\'t be blank')
      expect(page).not_to have_content('Craft beer')
    end

    scenario 'doesn\'t fill out date and topic' do
      user = FactoryGirl.create(:user)
      talk = Talk.create(topic: 'Craft beer', date: '2015-03-11')
      sign_in(user)

      click_link(talk.topic)
      click_link('Edit')

      fill_in 'Topic', with: ''
      fill_in 'Date', with: ''

      click_button 'Update'
      expect(page).to have_content('Topic can\'t be blank')
      expect(page).to have_content('Date can\'t be blank')
    end
  end
end
