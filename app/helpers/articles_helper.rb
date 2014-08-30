module ArticlesHelper

  def has_body(article)
    article.body != nil
  end

  def has_tags(article)
    article.tags != []
  end

  def has_url(article)
    article.url != nil
  end

  def date(article)
    "#{article.created_at.month}/#{article.created_at.day}/#{article.created_at.year}"
  end
end
