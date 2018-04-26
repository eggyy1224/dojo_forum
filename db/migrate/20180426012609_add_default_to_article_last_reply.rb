class AddDefaultToArticleLastReply < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :last_replied_at, :datetime, :default => Time.zone.now
  end
end
