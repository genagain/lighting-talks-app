class EmceeController < ApplicationController
  def index
    flash[:notice] = "Those are all of the lighting talk. Thank you for listenin" if params[:id].nil?
    @talks = Talk.where(date: Date.today)
  end

  def show
    @talk = Talk.find(params[:id])
    redirect_to talk_path(@talk)
  end
end
