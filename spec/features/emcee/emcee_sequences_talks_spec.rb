require 'rails_helper'

feature 'emcee clicks through all of the lighting talks for a day' do
  context 'user is emcee for the day' do
    scenario 'today is when lighting talks occur' do
      today = Date.today
      talks = []
      3.times { talks << FactoryGirl.create(:talk, date: today) }

      user = FactoryGirl.create(:user, emcee: today)
      sign_in(user)

      visit root_path

      click_link "Emcee Lighting Talks"

      click_link "Start Lighting Talks"

      talks.each do |talk|
        expect(page).to have_content(talk.topic)
        click_link 'Next Talk'
      end

      expect(page).to have_content("Those are all of the lighting talk. Thank you for listenin")
    end
  end
end
