class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  has_many :votes, as: :tally
end
