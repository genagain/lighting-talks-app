class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      flash[:notice] = 'You have scheduled a lighting talk!'
      redirect_to root_path
    else
      @talk.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to new_talk_path
    end
  end

  protected

  def talk_params
    params.require(:talk).permit(:topic, :date, :description)
  end
end
