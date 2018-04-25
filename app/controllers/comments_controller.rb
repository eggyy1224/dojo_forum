class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  # def create
  #   # binding.pry
  #   article = Article.find(params[:article_id])
  #   comment = article.comments.build(comment_params)
  #   comment.update(user_id: current_user.id)
  #   if comment.save
  #     flash[:notice] = "成功新增留言"
  #     redirect_back(fallback_location: root_path)
  #   else
  #     flash[:alert] = "新增留言失敗"
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.update(comment_params)
    # redirect_to @article
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    # redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
