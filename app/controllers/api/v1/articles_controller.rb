class Api::V1::ArticlesController < ApiController
  before_action :authenticate_user!, except: :index
  def index
    @articles = Article.all
    render json: {
        data: @articles
      } 
  end

  def show
    @article = Article.find_by(id: params[:id])
    unless @article
      render json: {
        message: "Can't find the article!",
        status: 400
      }
    else
      render json: @article
    end
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.build(article_params)
    if @article.save
      category_ids = params[:category_ids].split(',')
      category_ids.each do |category_id|
        @article.categories << Category.find(category_id)
      end
      render json: {
        message: "成功建立文章",
        result: @article
      }
    else
      render json: {
        errors: @article.errors
      }
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      render json: {
        message: "成功更新文章",
        result: @article
      }
    else
      render json: {
        errors: article.errors
      }
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    render json: {
      message: "成功刪除文章"
    }
  end

  private

  def article_params
    params.permit(:title, :content, :auth, :category_ids, :state, :image, :user_id)
  end
end
