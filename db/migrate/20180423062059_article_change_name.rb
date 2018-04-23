class ArticleChangeName < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :replies_count, :comments_count
  end
end
