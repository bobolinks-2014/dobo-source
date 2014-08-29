class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :comment
      t.belongs_to :article
      t.timestamps
    end
  end
end
