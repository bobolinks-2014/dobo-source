require 'spec_helper'

describe VotesController do
	include RequestHelpers
	include Devise::TestHelpers
	
	let(:article) do
		Article.create!(title: "cool title", short_description: "this is a description of the article", user_id: 1)
	end
	let(:user) { create_user }

	before do
		sign_in user
	end

	it 'should have create a vote when a user is logged in' do
		
		json = { article_id: article.id, vote: {tally_id: article.id, tally_type: 'Article'}}
		
		expect {
			post :create, json.merge(format: :json)
		}.to change { Article.find(article.id).votes_count }.by(1)
		
		logout
	end	


end
 