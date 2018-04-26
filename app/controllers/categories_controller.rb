class CategoriesController < ApplicationController
  def show
    @order_tag = params[:tag]
    @category = Category.find(params[:id])
    @category_tag = @category.name
    case params[:tag]
    when nil then @articles =  viewable_articles(@category).order(:id).page(params[:page])
    when 'last_replied_at' then @articles =  viewable_articles(@category).order('last_replied_at DESC').page(params[:page])
    when 'comments_count' then @articles =  viewable_articles(@category).order(comments_count: :desc).page(params[:page])
    when 'views_count' then @articles =  viewable_articles(@category).order(views_count: :desc).page(params[:page])
    end
  end

  private

  def viewable_articles(category)
    @category.articles.where(state: 'publish')
  end
end
