require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = User.new(email: "email@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end
