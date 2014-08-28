class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :tally_type
      t.integer :tally_id
      t.integer :user_id

      t.timestamps
    end
  end
end
