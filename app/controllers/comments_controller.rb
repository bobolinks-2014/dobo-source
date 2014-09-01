class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  respond_to :json
  
  def index
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update(commenter: current_user)
        respond_to do |format|
          format.json { render json: {id: @comment.id, comment: @comment.body, commenter: @comment.commenter.email, success: 1} }
        end
    else
      respond_to do |format|
        format.json { render json: {success: 0} }
        end
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
