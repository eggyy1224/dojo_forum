class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :state
      t.string :auth
      t.integer :replies_count
      t.integer :views_count
      t.index :user_id
      t.timestamps

    end
  end
end
