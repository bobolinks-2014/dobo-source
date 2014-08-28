class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new] 

  def index 
    @articles = Article.all.order(created_at: :desc)  
  end


  def new

  end
  
  def show
  	@article = Article.find(params[:id])
  end

  def edit

  end
  
  def destroy

  end


  private
  
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
  
end
