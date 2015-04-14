class CommentsController < ApplicationController
  def create
    @talk = Talk.find(params[:talk_id])
    @comment = Comment.create(talk_id: @talk.id, content: params[:comment][:content], user_id: 1)
    @comment.errors.full_messages.each do |error|
      flash[:alert] = "You cannot submit a blank comment"
    end
    redirect_to talk_path(@talk)
  end

  def edit
    @comment = Comment.find(params[:id])
    @talk = @comment.talk
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:comment][:content]
    if @comment.save
      flash[:notice] = 'Review successfully created'
      redirect_to talk_path(@comment.talk)
    else
      flash[:alert] = "You cannot submit a blank comment"
      redirect_to edit_talk_path(@comment.talk, @comment)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @talk = @comment.talk
    if @comment.destroy
      flash[:notice] = "You have deleted your comment"
    else
      flash[:alert] = "Your comment cannot be deleted"
    end
    redirect_to talk_path(@talk)
  end
end

