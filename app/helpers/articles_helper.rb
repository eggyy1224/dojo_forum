module ArticlesHelper
  def last_replied_at(article)
    if article.last_replied_at
      article.last_replied_at.strftime("%m/%d/%Y")
    end
  end

  def user_collected?(article)
    # binding.pry
    current_user.collection_articles.include?(article)
  end

  def author?(article)
    article.user == current_user
  end

  def article_can_show?(article)
    if author?(article) || article.auth == 'all'
      true
    elsif article.auth == 'self'
      false
    else
      is_friend?(article.user)
    end

  end

  def transcript_tag(tag)
    case tag
    when nil then '文章編號'
    when 'last_replied_at' then '最後回覆時間'
    when 'comments_count' then '回覆數'
    when 'views_count' then '觀看數'
    end
  end
end
