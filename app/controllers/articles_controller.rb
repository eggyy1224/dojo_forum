class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles =  Article.all.where(state: 'publish')
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      params[:article][:category_ids].delete("")
      params[:article][:category_ids].each do |category_id|
        @article.categories << Category.find(category_id)
      end
      flash[:notice] = "成功新增文章"
      redirect_to @article
    else
      flash[:alert] = "新增文章失敗"
      render :new
    end
  end

  def show
    # @article = Article.find(params[:id])
    @user = @article.user
    @comment = Comment.new
  end

  # def edit
  #   @article = Article.find(params[:id])
  # end

  def update
    if @article.save
      @article.categories.delete_all
      params[:article][:category_ids].delete("")
      params[:article][:category_ids].each do |category_id|
        @article.categories << Category.find(category_id)
      end
      flash[:notice] = "成功修改文章"
      redirect_to @article
    else
      flash[:alert] = "新增文章失敗"
      render :new
    end
  end

  def destroy
    if current_user == @article.user
      @article.delete
      flash[:notice] = "成功刪除"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "無法操作"
      redirect_back(fallback_location: root_path)
    end
  end

  def comment
    article = Article.find(params[:id])
    comment = article.comments.build(comment_params)
    comment.update(user_id: current_user.id)
    if comment.save
      flash[:notice] = "成功新增留言"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "新增留言失敗"
      redirect_back(fallback_location: root_path)
    end
  end

  def collect
    article = Article.find(params[:id])
    article.collections.create(user_id: current_user.id)
    flash[:notice] = "成功收藏此文章"
    redirect_back(fallback_location: root_path)
  end

  def uncollect
    collection = Collection.where(user_id: current_user.id, article_id: params[:id])[0]
    collection.delete
    flash[:notice] = "成功取消收藏"
    redirect_back(fallback_location: root_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :auth, :category_ids, :state)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
