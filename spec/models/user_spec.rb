require 'spec_helper'

describe User do
  describe 'association tests' do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end
  
  describe 'validations' do
    it 'should validate uniqueness of email' do
      should validate_uniqueness_of(:email)
    end
  end
end
