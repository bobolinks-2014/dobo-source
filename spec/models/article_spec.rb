require 'spec_helper'

describe Article do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:short_description) }
  end

  describe 'associations' do
    # it { should belong_to(:poster).class_name('User'), foreign_key: 'user_id' }
    it { should have_many(:votes) }
    it { should have_many(:comments) }
  end

end
