class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit] 

  def index 
    @articles = Article.all.order(created_at: :desc)  
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      @article.update(poster: current_user)
      redirect_to article_path(@article)
    else
      flash[:alert] = @article.errors.full_messages.join(",")
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
   @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
  end


  private
  
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
  
end
