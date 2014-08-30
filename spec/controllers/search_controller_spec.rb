require 'spec_helper'

describe SearchController do
	
	let(:article) do
		Article.create!(title: "cool title", short_description: "this is a description of the article", user_id: 1)
	end

	describe 'searching with one article tag on an article with one tag' do
		it 'should find an article with one tag' do
			article.tag_list.add("css")
			article.save
			json = {query: "css"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should not find an article without a tag' do
			json = {query: "css"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(404)
		end

	end

	describe 'search with one tag on an article with mutliple tags' do
		it 'should find an article with multiple tags searching with one tags' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should not find the article with multiple tags because it does not have the searched tag' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(404)
		end
	end

	describe 'search with 2 tags on an article with those same 2 tags' do
		it 'should find the article with multiple tags when those tags are searched, with comma no space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css,json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with comma and space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css, json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end
	end

	describe 'search with 2 tags on an article with 1/2 of those same tags' do
		it 'should find the article with multiple tags when those tags are searched, with comma no space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css,jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with comma and space as delimeter' do
			article.tag_list.add("css", "json")
			article.save
			json = {query: "css, jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end
	end

	describe 'search with 2 tags on an article with those same 2/3 tags' do
		it 'should find the article with multiple tags when those tags are searched, with comma no space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css,json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with comma and space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css, json"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end
	end

	describe 'search with 3 tags on an article with those same 2/3 tags' do
		it 'should find the article with multiple tags when those tags are searched, with comma no space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css,boborules,jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css boborules jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end

		it 'should find the article with multiple tags when those tags are searched, with comma and space as delimeter' do
			article.tag_list.add("css", "json", "jquery")
			article.save
			json = {query: "css, boborules, jquery"}
			get :search, json.merge(format: :json)
			expect(response.status).to eq(200)
		end
	end


end
