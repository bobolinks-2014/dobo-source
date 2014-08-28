class Article < ActiveRecord::Base
  validates_presence_of :title, :short_description

  acts_as_taggable
  belongs_to :user
  has_many :votes, as: :tally 
end
