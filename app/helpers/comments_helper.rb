module CommentsHelper
  def comment_author?(comment)
    comment.user == current_user
  end
end
