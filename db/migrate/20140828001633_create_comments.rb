class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :body, null: false
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
