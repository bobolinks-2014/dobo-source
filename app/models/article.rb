class Article < ActiveRecord::Base
  validates_presence_of :title, :short_description

  acts_as_taggable
  belongs_to :poster, class_name: "User", foreign_key: "user_id"
  has_many :votes, as: :tally 
  has_many :comments
end
