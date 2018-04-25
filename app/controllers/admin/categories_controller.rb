class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      flash[:alert] = "修改失敗"
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:notice] = "新增類別成功"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "新增失敗"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.articles.blank?
      category.delete
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "無法刪除有文章使用的分類"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
