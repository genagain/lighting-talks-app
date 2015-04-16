class EmceeController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:notice] = "Those are all of the lighting talks. Thank you for listening"
    @talks = Talk.where(date: Date.today)
  end

  def new
    @emcee = current_user
  end

  def create
    @user = current_user
    parsed = params[:user][:emcee].split('-').map { |i| i.to_i }
    @date = Date.new(parsed[0], parsed[1], parsed[2])
    @user.emcee = @date
    if @user.save
      flash[:notice] = @date.strftime("You are the emcee for lighting talks on %B %-d")
      redirect_to speaker_path(@user)
    end
  end

  def show
    @talk = Talk.find(params[:id])
    redirect_to talk_path(@talk)
  end
end
