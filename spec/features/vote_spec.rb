require 'spec_helper'
include RequestHelpers
include WaitForAjax
Capybara.javascript_driver = :webkit

feature 'voting on an article on main page'do
	let(:user) { create_user }

	before do
		login(user)
		Article.create!(title: "New Article", short_description: "this is cool", user_id: user.id, tag_list: "phase1")
		visit root_path
	end

	scenario 'user votes on an article for the first time', js: true  do
		click_on("niiiiiice")
		wait_for_ajax
		expect(page).to have_content("Thanks for voting!")
		expect(page).to have_content(1)	
	end

	scenario 'user votes on an article for the second time', js: true do
		click_on("niiiiiice")
		visit root_path
		click_on("niiiiiice")
		wait_for_ajax
		expect(page).to have_content("You previously voted on that")
		expect(page).to have_content(1)	
	end
end

feature 'voting on comments on article page' do
	let(:user) { create_user }
	let(:article) {Article.create!(title: "New Article", short_description: "this is cool", user_id: user.id, tag_list: "phase1")}

	before do
		login(user)
		Comment.create(article: article, user_id: user.id, body: "this is a comment")
		visit article_comments_path(article)
	end

	scenario 'user votes on a comment for the first time', js: true do
		click_on("niiiiiice")
		wait_for_ajax
		expect(page).to have_content("Thanks for voting!")
		expect(page).to have_content(1)	
	end

	scenario 'user votes on a comment for the second time', js: true do
		click_on("niiiiiice")
		visit article_comments_path(article)
		click_on("niiiiiice")
		wait_for_ajax
		expect(page).to have_content("You previously voted on that")
		expect(page).to have_content(1)	
	end

end