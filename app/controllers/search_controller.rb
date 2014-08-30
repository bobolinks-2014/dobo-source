class SearchController < ApplicationController
  respond_to :json, :html
  #TODO: respond to html as well
  def search
    @articles = Article.tagged_with(get_params, any: true)
    if @articles == []
      respond_with @articles, status: 404
    else  
      respond_with @articles, status: 200
    end
  end

  private

  def get_params
    params[:query].split(/[\s,\,]/).delete_if {|tag| tag == ""}
  end

end
