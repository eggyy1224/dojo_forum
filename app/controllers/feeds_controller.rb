class FeedsController < ApplicationController
  def index
    @user_count = User.count
    @post_count = Article.count
    @comment_count = Comment.count
    @category_count = Category.count
    @chatter_users = User.order(comments_count: :desc).limit(10)
    @most_popular_post = Article.order(comments_count: :desc).limit(10)
  end
end
