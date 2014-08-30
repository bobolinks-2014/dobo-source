require 'spec_helper'
include RequestHelpers

feature 'User Creation' do
  scenario 'User signs up succesfully' do
    visit new_user_registration_path
    fill_in "Email", with: "Bob@bob.bob"
    fill_in "Password", with: "bobbobbob"
    fill_in "Password confirmation", with: "bobbobbob"
    click_on "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  
  scenario "User doesn't include email" do
    visit new_user_registration_path
    fill_in "Password", with: "asdfasdf"
    fill_in "Password confirmation", with: "asdfasdf"
    click_on "Sign up"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "User forgets to include password" do
    visit new_user_registration_path
    fill_in "Email", with: "Bob@bob.bob"
    click_on "Sign up"
    expect(page).to have_content("Password can't be blank Email Password Password confirmation Sign in Forgot your password?") 
  end

  scenario 'User cannot sign up with an email that already exists in the database' do
    create_user
    visit root_path
    click_on 'Sign Up'
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "bobbobbob"
    fill_in "Password confirmation", with: "bobbobbob"
    click_on "Sign up"
    expect(page).to have_content("Email has already been taken")
  end
end

feature 'User login' do
  scenario 'an existing user can login' do
    create_user
    visit root_path
    click_on 'Log In'
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "asdfasdf"
    click_on "Sign in"
    expect(page).to have_content("Signed in successfully.")
  end
end

feature 'User logout' do
  scenario 'a currently logged in user can logout' do
    create_user
    visit root_path
    click_on 'Log In'
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "asdfasdf"
    click_on "Sign in"
    click_on 'Log Out'
    expect(page).to have_content("Signed out successfully.")
  end
end
