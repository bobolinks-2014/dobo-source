class SearchController < ApplicationController
  respond_to :json, :html
  #TODO: respond to html as well
  def search
    @articles = Article.tagged_with(get_params, any: true).limit(20).order(:votes_count => :desc)
    if @articles == []
      respond_with @articles, status: 404
    else
      render json: {
        'html' => render_to_string(
          partial: 'search/results', 
          locals: {articles: @articles}),
        status: 200
      }
    end

  end
  private

  def get_params
    params[:query].split(/[\s,\,]/).delete_if {|tag| tag == ""}
  end

end
