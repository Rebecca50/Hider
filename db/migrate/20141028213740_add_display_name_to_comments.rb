class AddDisplayNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :display_name, :string
  end
end
