require 'spec_helper'

describe ArticlesController do
  before do
    Article.create(title: "New Title", url: "http://google.com", short_description: "hey there")
  end
  describe 'articles#index' do
    it 'should have a list of articles in descending order by created_at' do
      get :index
      expect(response.status).to eq 200
      expect(page).to have_content("New Title")
    end
  end
end
