class Article < ActiveRecord::Base
  validates_presence_of :title, :short_description

  acts_as_taggable
  belongs_to :user

  before_update :increase_vote_count
  before_save :add_user_id

  private

  def increase_vote_count
  end

  def add_user_id
  end
  
end
