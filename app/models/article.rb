class Article < ActiveRecord::Base
  has_many :votes
  has_many :comments

  validates_presence_of :title, :short_description
end
