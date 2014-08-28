class Article < ActiveRecord::Base
  validates_presence_of :title, :short_description

  acts_as_taggable
  belongs_to :poster, class_name: "User", foreign_key: "user_id"
  has_many :votes, as: :tally 
  has_many :comments
  
  before_save :increase_vote_count
  before_save :add_user_id
  
  private
  
  def increase_vote_count
  end

  def add_user_id
  end
end
