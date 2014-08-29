require 'spec_helper'

describe ArticlesController do
  include Devise::TestHelpers
  include RequestHelpers
	context 'when user is not logged in' do

	  it 'should have an index with a response of 200, OK' do
	    get :index
	    expect(response.status).to eq 200
	  end

	  it 'should not have access to the article#new page, response 302, redirect' do
	    get :new
	    expect(response.status).to eq 302
	  end

    it 'should have access to the article#show page, response 200' do
      article = Article.create(title: "asdf", url: "asdf", short_description: "asdf")
      visit article_path(article)
	    expect(response.status).to eq 200
	  end

	  it 'should not have access to the article#edit page, response 302, redirect' do
      article = Article.create(title: "asdf", url: "asdf", short_description: "asdf")
      visit edit_article_path(article)
      expect(page).to have_content("You need to sign in or sign up before continuing.")
	  end

	end

	context 'when user is logged in' do

	  it 'should have an index with a response of 200, OK' do
      create_logged_in_user
	    get :index
	    expect(response.status).to eq 200
      logout
	  end

	  it 'should have access to the article#new page, response 200' do
      create_logged_in_user
      visit new_article_path
	    expect(response.status).to eq 200
      logout
	  end

    it 'should have access to the article#show page, response 200' do
	   	article = Article.create(title: "asdf", url: "asdf", short_description: "asdf")
     	visit article_path(article)
	    expect(response.status).to eq 200
	  end

	end


end
