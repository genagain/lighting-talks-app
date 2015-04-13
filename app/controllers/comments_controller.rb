class CommentsController < ApplicationController
  def create
    @talk = Talk.find(params[:talk_id])
    @comment = Comment.create(talk_id: @talk.id, content: params[:comment][:content], user_id: 1)
    redirect_to talk_path(@talk)
  end

  def edit
    @comment = Comment.find(params[:id])
    @talk = @comment.talk
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:comment][:content]
    @comment.save
    flash[:notice] = 'Review successfully created'
    redirect_to talk_path(@comment.talk)
  end
end
