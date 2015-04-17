class SpeakersController < ApplicationController
  def show
    @user = current_user
    @talks = @user.talks
  end
end
