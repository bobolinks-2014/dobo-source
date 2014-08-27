class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :url
      t.string :short_description, null: false, limit: 140
      t.text :body
      t.integer :user_id
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
