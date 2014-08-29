require 'spec_helper'

describe Comment do
  describe 'comment associations' do
      it { should belong_to(:article) }
      it { should belong_to(:commenter).class_name('User'), foreign_key: 'user_id'}
      it { should have_many(:votes) }
  end

end
