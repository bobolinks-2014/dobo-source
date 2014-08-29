require 'spec_helper'

describe VotesController do

	describe 'when a user is logged in' do
		include RequestHelpers
		include Devise::TestHelpers
		
		let(:article) do
			Article.create!(title: "cool title", short_description: "this is a description of the article", user_id: 1)
		end

		let(:comment) do
			Comment.create!(article: article, user_id: 1, body: "This is a great article!")
		end

		let(:user) { create_user }

		before do
			sign_in user
		end

		it 'should create an article vote' do
			
			json = { article_id: article.id, vote: {tally_id: article.id, tally_type: 'Article'}}
			
			expect {
				post :create, json.merge(format: :json)
			}.to change { Article.find(article.id).votes_count }.by(1)
			
			logout
		end

		it 'should create a comment vote' do
			
			json = { article_id: article.id, comment_id: comment.id, vote: {tally_id: comment.id, tally_type: 'Comment'}}
			
			expect {
				post :create, json.merge(format: :json)
			}.to change { Comment.find(comment.id).votes_count }.by(1)
			
			logout
		end	
	
	end


end
 