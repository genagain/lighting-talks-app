require "rails_helper"

feature "user deletes comment" do
  context "autheticated user" do
    scenario "deletes a their comment" do
      user = FactoryGirl.create(:user)
      user_2 = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk, user: user_2)
      comment = FactoryGirl.create(:comment, talk: talk, user: user)

      sign_in(user)

      visit root_path
      click_link talk.topic
      click_on("delete-comment-#{comment.id}")
      expect(page).to have_content("You have deleted your comment")
      expect(page).to_not have_content(comment.content)
    end

    scenario "tries to delete someone else's comment" do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk, user: user)
      comment = FactoryGirl.create(:comment, talk: talk)

      sign_in(user)
      click_link talk.topic
      expect(page).to have_content(comment.content)
    end
  end
end
