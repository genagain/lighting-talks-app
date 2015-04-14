require "rails_helper"

feature "user deletes comment" do
  context "autheticated user" do
    scenario "deletes a their comment" do
      user = FactoryGirl.create(:user)
      talk = FactoryGirl.create(:talk)
      comment = FactoryGirl.create(:comment, talk: talk)

      sign_in(user)

      visit root_path
      click_link talk.topic
      click_on("delete-comment-#{comment.id}")
      expect(page).to have_content("You have deleted your comment")
      expect(page).to_not have_content(comment.content)
    end
  end
end
