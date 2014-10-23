class AddMoreDeviseFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :unconfirmed_email, :string
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
