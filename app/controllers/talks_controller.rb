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

  def show
    @talk = Talk.find(params[:id])
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    @talk.topic = talk_params[:topic]
    @talk.date = talk_params[:date]
    @talk.description = talk_params[:description]
    if @talk.save
      flash[:notice] = 'You have updated a lighting talk!'
      redirect_to talk_path(@talk)
    else
      @talk.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to edit_talk_path
    end
  end

  def destroy
    flash[:notice] = 'You have deleted a lighting talk!'
    Talk.destroy(params[:id])
    redirect_to talks_path
  end
  protected

  def talk_params
    params.require(:talk).permit(:topic, :date, :description, :video_url)
  end
end

