class CommentsController < ApplicationController
  def create
    @talk = Talk.find(params[:talk_id])
    @comment = Comment.new(talk: @talk, content: params[:comment][:content], user: current_user)
    if @comment.save
      flash[:notice] = 'Thanks for commenting'
    else
      flash[:notice] = "Comment can't be blank"
    end
    redirect_to talk_path(@talk)
  end
end
