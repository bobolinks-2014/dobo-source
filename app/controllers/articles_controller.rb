class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new] 

  def index 
    @articles = Article.all.order(created_at: :desc)  
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
  
end
