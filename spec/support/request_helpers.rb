require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = User.create(email: "email2@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    login(user)
    user
  end

  #logout is a warden helper method avail
  def login(user)
    login_as user, scope: :user
  end

  def create_user
    user = User.create(email: "email@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    user
  end
end
