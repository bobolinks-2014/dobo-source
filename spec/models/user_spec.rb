require 'spec_helper'

describe User do

  before do
    @user = User.new(email: "email@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
  end

  subject { @user }

  it { should respond_to(:email) }
end
