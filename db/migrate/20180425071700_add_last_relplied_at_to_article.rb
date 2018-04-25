class AddLastRelpliedAtToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :last_replied_at, :datetime
  end
end
