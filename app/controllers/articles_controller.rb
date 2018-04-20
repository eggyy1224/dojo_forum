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

  # def show
  #   @article = Article.find(params[:id])
  # end

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

  private

  def article_params
    params.require(:article).permit(:title, :content, :auth, :category_ids, :state)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
