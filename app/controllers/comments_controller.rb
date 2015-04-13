class CommentsController < ApplicationController
  def create
    @talk = Talk.find(params[:talk_id])
    @comment = Comment.create(talk_id: @talk.id, content: params[:comment][:content], user_id: 1)
    redirect_to talk_path(@talk)
  end
end
