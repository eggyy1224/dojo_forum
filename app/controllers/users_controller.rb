class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.where(state: 'publish')
  end

  def draft
    @user = User.find(params[:id])
    @drafts = @user.articles.where(state: 'draft')
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
  end

  def collection
  end

  def follower
  end

  private

  def user_params
    params.require(:user).permit(:name, :description)
  end
end
