module ArticlesHelper

  def has_body(article)
    article.body != nil
  end
  
  def is_owner_of_article(article)
    current_user == article.poster
  end

  def article_link(article)
    if article.url == "" || article.url == nil
        article_comments_path(article)
    else
        article.url
    end
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

  def check_for_phase_tag(article, value)
    article.tag_list.include?(value)
  end


end
