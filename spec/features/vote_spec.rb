require 'spec_helper'
include RequestHelpers
include WaitForAjax
Capybara.javascript_driver = :webkit

feature 'voting on article on main page'do
	let(:user) { create_user }

	before do
		login(user)
		Article.create!(title: "New Article", short_description: "this is cool", user_id: user.id, tag_list: "phase1")
		visit root_path
	end

	scenario 'user votes on article for the first time', js: true  do
		click_on("niiiiiice")
		wait_for_ajax
		expect(page).to have_content("Thanks for voting!")
		expect(page).to have_content(1)	
	end

	scenario 'user votes on article for the second time', js: true do
		click_on("niiiiiice")
		visit root_path
		click_on("niiiiiice")
		expect(page).to have_content("You previously voted on that")
		expect(page).to have_content(1)	
	end
end