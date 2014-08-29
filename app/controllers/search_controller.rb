class SearchController < ApplicationController
  respond_to :json, :html
  #TODO: add tests for controller
  #TODO: respond to html as well
  def search
    @articles = Article.tagged_with(get_params)
    if @articles == []
      respond_with @articles, status: 404
    else  
      respond_with @articles, status: 200
    end
  end

  private

  def get_params
    params[:query].split(" ")
  end

end
