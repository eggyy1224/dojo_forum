module ArticlesHelper
  def last_replied_at(article)
    if article.comments.order(updated_at: :desc).limit(1)[0]
      
      article.comments.order(updated_at: :desc).limit(1)[0].updated_at.strftime("%m/%d/%Y")
    end
  end

  def user_collected?(article)
    # binding.pry
    current_user.collection_articles.include?(article)
  end

  def author?(article)
    article.user == current_user
  end
end
