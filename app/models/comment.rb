class Comment < ActiveRecord::Base
  belongs_to :article
  # belongs_to :commenter
  has_many :votes
end
