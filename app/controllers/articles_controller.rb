class ArticlesController < ApplicationController
  
  private
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
end
