require 'spec_helper'
include RequestHelpers

feature 'Article Creation' do
	
	scenario 'Logged in user can create an article' do
		create_logged_in_user
		visit new_article_path
		fill_in "Title", with: "Bobo the Bobolink wins the game!"
		fill_in "Short Description", with: "New Short Description"
		check 'check_box_phase_0'
		fill_in "Post", with: "New Post"
		click_on "Create Article"
		expect(page).to have_content("BOBO THE BOBOLINK WINS THE GAME!")
	end

	scenario 'an article cannot be created without the user selecting a phase tag' do
		create_logged_in_user
		visit new_article_path
		fill_in "Title", with: "Bobo the Bobolink wins the game!"
		fill_in "Short Description", with: "New Short Description"
		fill_in "Post", with: "New Post"
		click_on "Create Article"
		expect(page).to have_content("You must select a phase tag!")
	end

end

feature 'Article Editing' do
	
	scenario 'Logged in user can edit an article that belongs to them' do
		user = create_logged_in_user
		article = Article.create(poster: user, title: "Bobo the Bobolink wins the game!", short_description: "It was an exciting game")
		visit edit_article_path(article)
		fill_in "Short Description", with: "The game was amazing!  Bobo saved the day!"
		check 'check_box_phase_1'
		click_on "Update Article"
		expect(page).to have_content("The game was amazing!  Bobo saved the day!")
	end

	scenario 'an article cannot be edited without the user selecting a phase tag' do
		user = create_logged_in_user
		article = Article.create(poster: user, title: "Bobo the Bobolink wins the game!", short_description: "It was an exciting game", body: "cool stuff")
		visit edit_article_path(article)
		fill_in "Title", with: "Bobo the Bobolink wins the game!"
		fill_in "Short Description", with: "New Short Description"
		fill_in "Post", with: "New Post"
		click_on "Update Article"
		expect(page).to have_content("You must select a phase tag!")
	end

end

feature 'Article Deletion' do
	
	scenario 'Logged in user can edit an article that belongs to them' do
		user = create_logged_in_user
		article = Article.create(poster: user, title: "Bobo the Bobolink wins the game!", short_description: "It was an exciting game")
		visit edit_article_path(article)
		click_on "Delete this Resource"
		expect(page).to have_content("Recent Resources")
	end

end

