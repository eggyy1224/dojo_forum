class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.where(state: 'publish')
  end

  def draft
    @user = User.find(params[:id])
    @drafts = @user.articles.where(state: 'draft')
  end

  def comment
  end

  def collection
  end

  def follower
  end
end
