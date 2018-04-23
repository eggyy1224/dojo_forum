class ArticleChangeCommentsCountDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :comments_count, :integer, :default => 0
    change_column :articles, :views_count, :integer, :default => 0
  end
end
