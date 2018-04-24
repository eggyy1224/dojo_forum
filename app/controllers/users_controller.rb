class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.where(state: 'publish')
  end

  def draft
    @user = User.find(params[:id])
    if @user == current_user
      @drafts = @user.articles.where(state: 'draft')
    else
      flash[:alert] = "禁止訪問"
      redirect_back(fallback_location: root_path)
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "個人資料更新成功"
      redirect_to @user
    else
      flash[:alert] = "無法操作"
      render :edit
    end
  end

  def comment
    @user = User.find(params[:id])
    # binding.pry
    @articles = @user.commentted_articles.uniq
  end

  def collection
    @user = User.find(params[:id])
    @articles = @user.collection_articles
  end

  def follower
    @user = User.find(params[:id])
    @inviters = @user.inviters
    @invitees = @user.invitees
    @friends = @user.friends
  end

  private

  def user_params
    params.require(:user).permit(:name, :description)
  end
end
