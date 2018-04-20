class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @articles =  Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      params[:article][:category_ids].delete("")
      params[:article][:category_ids].each do |category_id|
        # binding.pry
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
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :auth, :category_ids)
  end
end
