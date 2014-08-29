class User < ActiveRecord::Base
  has_many :comments
  has_many :articles
  has_many :votes
  validates :email, presence: true, uniqueness: true
end
