class ArticlesController < ApplicationController
  before_update :increase_vote_count
  before_save :add_user_id

  private
  
  def article_params
    params.require(:article).permit(:title, :url, :short_description, :body, :tag_list)
  end
  
  def increase_vote_count
  end

  def add_user_id
  end
end
