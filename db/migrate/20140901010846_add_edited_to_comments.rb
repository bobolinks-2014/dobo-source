class AddEditedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :edited, :boolean, default: false
  end
end
