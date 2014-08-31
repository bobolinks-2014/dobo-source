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
    
    # TODO: fix error message for phase tags to include all problems
    # TODO: flash alert persists through redirect
    if params["phase_tag"] == nil
      errors = ["You must select a phase tag!"]
      flash.now[:alert] = errors.join(', ')
      render "new"
    elsif @article.save
      params["phase_tag"].each do |phase_tag|
        @article.tag_list.add(phase_tag)
      end
      @article.save
      @article.update(poster: current_user)
      redirect_to article_comments_path(@article)
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

  def update 
    @article = Article.find(params[:id])
    if params["phase_tag"] == nil
      errors = ["You must select a phase tag!"]
      flash.now[:alert] = errors.join(', ')
      render "new"
    elsif @article.update(article_params)
      params["phase_tag"].each do |phase_tag|
        @article.tag_list.add(phase_tag)
      end
      @article.save
      redirect_to article_comments_path(@article)
    else
      flash.now[:alert] = @article.errors.full_messages.join(",")
      render "edit"
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end


  private
  
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
  
end
