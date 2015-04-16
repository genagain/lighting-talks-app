require 'rails_helper'

feature 'emcee clicks through all of the lighting talks for a day' do
# [] Users can view if there is an MC for the week
# [x] Users can schedule which day they want to MC
# [] Users can reschedule when they want to MC
# [] Users can delete when they MC
# [x] The MC can click a button to start lighting talks
# [x] The people doing lighting talks will be displayed in order
# [x] At the end of the sequence a message is displayed saying that it’s the end of lighting talks
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

      expect(page).to have_content("Those are all of the lighting talks. Thank you for listening")
    end
  end

  context 'user is not the emcee for the day' do
    scenario 'schedules when they want to be emcee next' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit root_path
      click_link "Profile"

      click_link "Emcee for lighting talks"

      fill_in 'Lighting Talk Date', with: '2015-04-30'

      click_button "Emcee Lighting Talks"
      expect(page).to have_content('You are the emcee for lighting talks on April 30')
    end
  end

  context "user is emcee for a future lighting talk" do
    scenario "reschedules when they emcee" do
      # tomorrow = Date.today + 1

      # user = FactoryGirl.create(:user, emcee: tomorrow)
      # sign_in(user)

      # visit root_path

      # click_link "Profile"

      # click_link "Update"

      # fill_in 'Lighting Talk Date', with: '2015-5-30'
      # click_button "Emcee Lighting Talks"

      # expect(page).to have_content('You are the emcee for lighting talks on May 30')
    end
  end

end
