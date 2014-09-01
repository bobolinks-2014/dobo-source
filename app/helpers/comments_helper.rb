module CommentsHelper
	def date(comment)
    "#{comment.created_at.month}/#{comment.created_at.day}/#{comment.created_at.year}"
  end

  def comment_by_votes(article)
    article.comments.order(votes_count: :desc)
  end

  def is_commenter?(comment)
    comment.commenter == current_user && comment.edited != true
  end

  def is_voteable?(comment)
    comment.commenter == current_user && comment.edited != true
  end
end
