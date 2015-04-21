class TalksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    talk_params[:video_url].gsub!("watch?v=","embed/")
    @talk = Talk.new(talk_params)
    @talk.user_id = current_user.id
    if @talk.save
      flash[:notice] = 'You have scheduled a lighting talk!'
      redirect_to root_path
    else
      @talk.errors.full_messages.each { |error| flash[error] = error }
      redirect_to new_talk_path
    end
  end

  def show
    @talks = Talk.where(date: Date.today)
    @talk = Talk.find(params[:id])
    @comments = @talk.comments
    @comment = Comment.new
    @filler_counts = @talk.count_fillers
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if params[:talk][:transcript]
      @talk.transcript = params[:talk][:transcript].gsub(/\s{2,}/,' ').lstrip.rstrip
      @talk.find_wasted_words
    else
      @talk.update(talk_params)
    end

    if @talk.save
      flash[:notice] = 'You have updated a lighting talk!'
      redirect_to talk_path(@talk)
    else
      @talk.errors.full_messages.each { |error| flash[error] = error }
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

