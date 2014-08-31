require 'spec_helper'

describe CommentsController do
  
  describe 'when a user is logged in' do
    include RequestHelpers
    include Devise::TestHelpers

    let(:article) do
      Article.create!(title: "cool title", short_description: "this is a description.", user_id: 1)  
    end

    let(:user) { create_user } 

    before do
      sign_in user
    end

    pending 'should create a new comment' do
      json = {comment: {body: "hey", article_id: article.id }}
      expect {
          post :create, json.merge(format: :json)
      }.to change { Article.find(article.id).comments.count }.by(1)
    end
  end

end
