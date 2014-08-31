class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  #TODO: Ask Nate why this is happening

  def index
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update(commenter: current_user)
        respond_to do |format|
          format.json { render json: {comment: @comment.body, commenter: @comment.commenter.email, success: 1} }
        end
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
