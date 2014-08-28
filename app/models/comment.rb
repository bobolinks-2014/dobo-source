class Comment < ActiveRecord::Base
  has_many :votes, as: :tally
end
