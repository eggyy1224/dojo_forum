class ArticlesController < ApplicationController
  # before_action :authenticate_user!
  def index
  end

  def new
    @article = Article.new
  end
end
