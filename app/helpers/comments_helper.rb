module CommentsHelper
	def date(comment)
    "#{comment.created_at.month}/#{comment.created_at.day}/#{comment.created_at.year}"
  end
end
