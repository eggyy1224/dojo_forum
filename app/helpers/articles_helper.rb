module ArticlesHelper
  def last_replied_at(article)
    Time.zone.now
  end

  def user_collected?(article)
    # binding.pry
    current_user.collection_articles.include?(article)
  end

  def author?(article)
    article.user == current_user
  end
end
